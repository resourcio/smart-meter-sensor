var VERSION="%%%%%VERSION_PLACEHOLDER%%%%%"
import webserver
import string
import persist
import json

#var CONFIG_SERVER_URL='http://192.168.178.59:8081/autoexec.be'
var CONFIG_SERVER_URL='https://resourcio-webapp-production.azurewebsites.net/configs/autoexec.be'
#var SMART_METER_CONFIG_SERVER_URL='http://192.168.178.59:8081/configs/'
var SMART_METER_CONFIG_SERVER_URL='https://resourcio-webapp-production.azurewebsites.net/configs/'

var VERSION_SERVER_URL='https://resourcio-webapp-production.azurewebsites.net/version'
var CONFIG_UPDATE_INTERVAL_CRON="0 0 * * * *"
var FIRMWARE_UPDATE_INTERVAL_CRON="0 2 * * * *"
var DEFAULT_SMART_METER="Logarex_LK13BE"

class Resourcio : Driver
  var initialized
  

  def every_second()
    if self.initialized == false
      self.check_inet_connection()
    end
    
    # reset tageszähler in case they equal or higher than the overall counter
    var sensors = json.load(tasmota.read_sensors())
    #if sensors['']['Total_in'] != nil &&  tageszähler >= sensors['']['Total_in']
    #  reset_counter()
    #end
  end

  def every_100ms()
    #var sensors = json.load(tasmota.read_sensors())
    
    # if sensors['']['Power_curr'] != nil && sensors['']['Power_curr'] == 0
    #   self.toggle_led(0)
    # else 
    #   self.toggle_led(1)
    # end
  end

  def toggle_led(state)
    gpio.pin_mode(2, gpio.OUTPUT)   
    gpio.digital_write(2,state)
  end

  def init()
    self.initialized = false
    # init config updater
    log('Resourcio: init',2)
    
    # todo: activate with 12.3.0
    # import mdns
    # mdns.start()
    # mdns.add_service("_resourcio","_http", 5540, {"VP":"65521+32768", "SII":5000, "SAI":300, "T":1, "D":3840, "CM":1, "PH":33, "PI":""})

    # read active config from persist
    log(string.format('Resourcio: Active Smart Meter Config: %s',persist.activeSmartMeterConfig))

    # set default smart meter
    if persist.activeSmartMeterConfig == nil
      log('Resourcio: Set default smart meter config',3)
      persist.activeSmartMeterConfig = DEFAULT_SMART_METER
    end

    # init config update cron
    tasmota.add_cron(CONFIG_UPDATE_INTERVAL_CRON, / ->  self.config_updater(), "every_15_s")

    # init firmware update cron
    tasmota.add_cron(FIRMWARE_UPDATE_INTERVAL_CRON, / ->  self.firmware_updater(), "every_24_h")
  end

  def check_inet_connection()
    if tasmota.wifi().find('ip') != nil
      self.initialized = true
      self.config_updater()
    else 
      log('Resourcio: No inet connection',3)
    end
  end

  def config_updater()
    log('Resourcio: Check for newer config version ... ',3)
    var s = self.get_version_information()
    if self.is_version_newer(VERSION,s)
      log('Resourcio: Newer version on server',3)
      self.perform_config_update()
    else
      log('Resourcio: Nothing to update',3)
    end
  end

  def firmware_updater()
    log('Resourcio: Check for newer firmware version ... ',3)
    var s = self.get_version_information()
    if self.is_new_major_version_available(VERSION,s)
      log('Resourcio: Newer firmware version on server',3)
      self.perform_firmware_update()
    else
      log('Resourcio: Nothing to update',3)
    end
  end

  def perform_config_update()
    log('Resourcio: Updating config ...',2)
    # download new autoexec
    tasmota.urlfetch(CONFIG_SERVER_URL)

    # Download new script for currently selected smart meter
    self.downloadSmartMeterScript(persist.activeSmartMeterConfig)

    # reboot
    log('Resourcio: Update successful -> reboot',2)
    tasmota.cmd("Restart 1")
  end

  def perform_firmware_update()
    log('Resourcio: Updating firmware ...',2)
    tasmota.cmd("Upgrade 1")
  end

  def get_version_information()
    var cl = webclient()
    cl.begin(VERSION_SERVER_URL)
    var r = cl.GET()
    log(r,3)
    var s = cl.get_string()
    return s
  end

  def is_new_major_version_available(old, new)
    var old_version = string.split(old, ".")
    var new_version = string.split(new, ".")

    if size(old_version)!=3 || size(new_version)!=3
      return false
    end

    if int(old_version[0])< int(new_version[0])
      return true
    else
      return false
    end
  end
  

  def is_version_newer(old, new)
    var old_version = string.split(old, ".")
    var new_version = string.split(new, ".")

    if size(old_version)!=3 || size(new_version)!=3
      return false
    end

    if int(old_version[0])< int(new_version[0])
      return true
    elif (int(old_version[0])==int(new_version[0])) && (int(old_version[1]) < int(new_version[1]))
      return true
    elif (int(old_version[0])==int(new_version[0])) && (int(old_version[1])==int(new_version[1])) && (int(old_version[2]) < int(new_version[2]))
      return true
    else
      return false
    end
  end



  def web_sensor()
    webserver.content_send('<div style="margin: auto; width: 100px;"><img alt="" style="width: 70px;" src="data:image/png;base64,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" /></div>')
    var smart_meter = (persist.activeSmartMeterConfig == nil) ? "-" : persist.activeSmartMeterConfig
    webserver.content_send(string.format("{s}Smart Meter {m}%s{e}", smart_meter))
  end

  def web_add_config_button()
    webserver.content_send('<button name="smart_meter_config" onclick="location.href=\'smartmeterconfig\';" style="background:#4DA772;">Smart Meter konfiguration</button>')
  end


  def createSmartMeterList()
    var result = '<select name="configs" id="configs">'
    var supportedSmartMeters = {
      '-':'-',
      'SGM_C8': 'SGM C8',
      'Holley_DTZ541': 'Holley DTZ541',
      'Itron_ACE3000_Typ260': "Itron ACE3000 Typ260",
      'Logarex_LK13BE': 'Logarex LK13BE'
      }
    for i : supportedSmartMeters.keys()
        if persist.activeSmartMeterConfig == i 
          result += string.format('<option value="%s" selected>%s</option>',i,supportedSmartMeters[i])
        else
          result += string.format('<option value="%s">%s</option>',i,supportedSmartMeters[i])
        end
    end
    result += "</select>"
    return result
  end

  #- this method displays the web page -#
  def page_smart_meter_config()
    if !webserver.check_privileged_access() return nil end
    var html_space = '%20'
    var restart_url = '/md?g99=0&g0=0&g1=0&g2=0&g3=0&g4=0&g5=0&g6=0&g7=0&g8=0&g9=0&g10=0&g18=0&g19=0&g20=0&g21=0&save='
    var on_click = string.format('(function(){ fetch(\'/cm?cmnd=SelectSmartMeter%s\'+document.getElementById(\'configs\').value).then(response => { setTimeout(location.href=\'%s\',2000);})  })();', html_space, restart_url)
    var button_code = string.format('<p></p><button name="save" onclick="%s" type="submit" class="button bgrn">Speichern</button>',on_click)
    webserver.content_start("Smart Meter Config")
    webserver.content_send_style()
    webserver.content_send('<h3> Bitte wähle dein Smart Meter aus</h3>')
    webserver.content_send(self.createSmartMeterList())
    webserver.content_send(button_code)
    webserver.content_button(webserver.BUTTON_CONFIGURATION)
    webserver.content_stop()
  end

  def web_add_handler()
    #- we need to register a closure, not just a function, that captures the current instance -#
    webserver.on("/smartmeterconfig", / -> self.page_smart_meter_config())
  end

  def reset_counter()
    # reset script values
    tasmota.cmd("script>=#dreset")
    tasmota.cmd("script>=#dtreset")
    tasmota.cmd("script>=#mtreset")
  end

  def downloadSmartMeterScript(smartMeter)
    # new source filename 
    var newConfigFileName = string.format('%s.txt', smartMeter)
  
    # take smartMeter and send request to server
    var configUrl = string.format('%s%s',SMART_METER_CONFIG_SERVER_URL, newConfigFileName)
      
    # take response and save to script.txt
    log(string.format('Resourcio: Download config from', configUrl),3)
    tasmota.urlfetch(configUrl)
  
    # rename file to script.txt
    var renameCmd = string.format('UfsRename2 %s,script.txt', newConfigFileName)
    
    tasmota.cmd("UfsDelete2 script.txt")
    tasmota.cmd(renameCmd)
  
  end

  def selectSmartMeter(cmd, idx, payload, payload_json)
    log('Resourcio: selectSmartMeter command called',3)
    
    self.downloadSmartMeterScript(payload)
  
    # store active smart meter to _persist.json
    persist.activeSmartMeterConfig = payload
    persist.save()
  
    # enable script
    tasmota.cmd("Script1 1")
  
    # reset script values
    self.reset_counter()
  
  end
end

#- create and register driver in Tasmota -#
resourcio = Resourcio()
tasmota.add_driver(resourcio)

def selectSmartMeter(cmd, idx, payload, payload_json)
 resourcio.selectSmartMeter(cmd, idx, payload, payload_json)
 # send response to web ui
 tasmota.resp_cmnd_done()
  
 # reboot -> will be done by JS in frontend after response to display device restart page 
 # tasmota.cmd("Restart 1")
end
tasmota.add_cmd('SelectSmartMeter', selectSmartMeter)