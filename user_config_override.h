#ifndef _USER_CONFIG_OVERRIDE_H_
#define _USER_CONFIG_OVERRIDE_H_

#ifdef CODE_IMAGE_STR
  #undef CODE_IMAGE_STR
#endif
#define CODE_IMAGE_STR "TasmoCompiler-esp32generic"

#ifdef USE_ENERGY_SENSOR
  #undef USE_ENERGY_SENSOR
#endif

#ifdef USE_SR04
  #undef USE_SR04
#endif

#ifdef USE_VL53L0X
  #undef USE_VL53L0X
#endif

#ifdef USE_HRXL
  #undef USE_HRXL
#endif

#ifdef USE_DYP
  #undef USE_DYP
#endif

#ifdef USE_VL53L1X
  #undef USE_VL53L1X
#endif

#ifdef USE_EMULATION
  #undef USE_EMULATION
#endif

#ifdef USE_EMULATION_HUE
  #undef USE_EMULATION_HUE
#endif

#ifdef USE_EMULATION_WEMO
  #undef USE_EMULATION_WEMO
#endif

#ifdef USE_ADC_VCC
  #undef USE_ADC_VCC
#endif

#ifdef USE_TASMOTA_CLIENT
  #undef USE_TASMOTA_CLIENT
#endif

#ifdef USE_BERRY
  #undef USE_BERRY
#endif
#define USE_BERRY

#ifdef USE_BERRY_PSRAM
  #undef USE_BERRY_PSRAM
#endif
#define USE_BERRY_PSRAM

#ifdef USE_BLE_ESP32
  #undef USE_BLE_ESP32
#endif

#ifdef USE_MI_ESP32
  #undef USE_MI_ESP32
#endif

#ifdef USE_DISPLAY
  #undef USE_DISPLAY
#endif

#ifdef USE_DISPLAY_MODES1TO5
  #undef USE_DISPLAY_MODES1TO5
#endif

#ifdef USE_DISPLAY_LCD
  #undef USE_DISPLAY_LCD
#endif

#ifdef USE_DISPLAY_SSD1306
  #undef USE_DISPLAY_SSD1306
#endif

#ifdef USE_DISPLAY_MATRIX
  #undef USE_DISPLAY_MATRIX
#endif

#ifdef USE_DISPLAY_ILI9341
  #undef USE_DISPLAY_ILI9341
#endif

#ifdef USE_DISPLAY_EPAPER_29
  #undef USE_DISPLAY_EPAPER_29
#endif

#ifdef USE_DISPLAY_EPAPER_42
  #undef USE_DISPLAY_EPAPER_42
#endif

#ifdef USE_DISPLAY_SH1106
  #undef USE_DISPLAY_SH1106
#endif

#ifdef USE_DISPLAY_ILI9488
  #undef USE_DISPLAY_ILI9488
#endif

#ifdef USE_DISPLAY_SSD1351
  #undef USE_DISPLAY_SSD1351
#endif

#ifdef USE_DISPLAY_RA8876
  #undef USE_DISPLAY_RA8876
#endif

#ifdef USE_DISPLAY_SEVENSEG
  #undef USE_DISPLAY_SEVENSEG
#endif

#ifdef USE_DISPLAY_ST7789
  #undef USE_DISPLAY_ST7789
#endif

#ifdef USE_DISPLAY_SSD1331
  #undef USE_DISPLAY_SSD1331
#endif

#ifdef USE_DOMOTICZ
  #undef USE_DOMOTICZ
#endif

#ifdef USE_HOME_ASSISTANT
  #undef USE_HOME_ASSISTANT
#endif

#ifdef USE_MCP230xx
  #undef USE_MCP230xx
#endif

#ifdef USE_MCP230xx_OUTPUT
  #undef USE_MCP230xx_OUTPUT
#endif

#ifdef USE_MCP230xx_DISPLAYOUTPUT
  #undef USE_MCP230xx_DISPLAYOUTPUT
#endif

#ifdef USE_I2C
  #undef USE_I2C
#endif

#ifdef USE_IR_REMOTE
  #undef USE_IR_REMOTE
#endif

#ifdef USE_IR_REMOTE_FULL
  #undef USE_IR_REMOTE_FULL
#endif

#ifdef USE_KNX
  #undef USE_KNX
#endif

#ifdef USE_BH1750
  #undef USE_BH1750
#endif

#ifdef USE_VEML6070
  #undef USE_VEML6070
#endif

#ifdef USE_TSL2561
  #undef USE_TSL2561
#endif

#ifdef USE_SI1145
  #undef USE_SI1145
#endif

#ifdef USE_APDS9960
  #undef USE_APDS9960
#endif

#ifdef USE_VEML6075
  #undef USE_VEML6075
#endif

#ifdef USE_MAX44009
  #undef USE_MAX44009
#endif

#ifdef USE_TSL2591
  #undef USE_TSL2591
#endif

#ifdef USE_AS3935
  #undef USE_AS3935
#endif

#ifdef USE_VEML7700
  #undef USE_VEML7700
#endif

#ifdef USE_MHZ19
  #undef USE_MHZ19
#endif

#ifdef USE_SENSEAIR
  #undef USE_SENSEAIR
#endif

#ifdef USE_PMS5003
  #undef USE_PMS5003
#endif

#ifdef USE_MGS
  #undef USE_MGS
#endif

#ifdef USE_NOVA_SDS
  #undef USE_NOVA_SDS
#endif

#ifdef USE_SGP30
  #undef USE_SGP30
#endif

#ifdef USE_CCS811
  #undef USE_CCS811
#endif

#ifdef USE_SCD30
  #undef USE_SCD30
#endif

#ifdef USE_SPS30
  #undef USE_SPS30
#endif

#ifdef USE_HPMA
  #undef USE_HPMA
#endif

#ifdef USE_IAQ
  #undef USE_IAQ
#endif

#ifdef USE_T67XX
  #undef USE_T67XX
#endif

#ifdef USE_VINDRIKTNING
  #undef USE_VINDRIKTNING
#endif

#ifdef USE_SCD40
  #undef USE_SCD40
#endif

#ifdef USE_HM330X
  #undef USE_HM330X
#endif

#ifdef USE_DISCOVERY
  #undef USE_DISCOVERY
#endif
#define USE_DISCOVERY

#ifdef USE_MQTT_TLS
  #undef USE_MQTT_TLS
#endif
#define USE_MQTT_TLS

#ifdef USE_RULES
  #undef USE_RULES
#endif

#ifdef USE_EXPRESSION
  #undef USE_EXPRESSION
#endif

#ifdef SUPPORT_IF_STATEMENT
  #undef SUPPORT_IF_STATEMENT
#endif

#ifdef USE_RC_SWITCH
  #undef USE_RC_SWITCH
#endif

#ifdef USE_UFILESYS
  #undef USE_UFILESYS
#endif

#ifdef USE_SDCARD
  #undef USE_SDCARD
#endif

#ifdef GUI_TRASH_FILE
  #undef GUI_TRASH_FILE
#endif

#ifdef GUI_EDIT_FILE
  #undef GUI_EDIT_FILE
#endif

#ifdef USE_SCRIPT
  #undef USE_SCRIPT
#endif
#define USE_SCRIPT

#ifdef USE_SPI
  #undef USE_SPI
#endif
#define USE_SPI

#ifdef USE_HLW8012
  #undef USE_HLW8012
#endif

#ifdef USE_CSE7766
  #undef USE_CSE7766
#endif

#ifdef USE_PZEM004T
  #undef USE_PZEM004T
#endif

#ifdef USE_MCP39F501
  #undef USE_MCP39F501
#endif

#ifdef USE_PZEM_AC
  #undef USE_PZEM_AC
#endif

#ifdef USE_PZEM_DC
  #undef USE_PZEM_DC
#endif

#ifdef USE_ADE7953
  #undef USE_ADE7953
#endif

#ifdef USE_SDM120
  #undef USE_SDM120
#endif

#ifdef USE_DDS2382
  #undef USE_DDS2382
#endif

#ifdef USE_SDM630
  #undef USE_SDM630
#endif

#ifdef USE_DDSU666
  #undef USE_DDSU666
#endif

#ifdef USE_SOLAX_X1
  #undef USE_SOLAX_X1
#endif

#ifdef USE_LE01MR
  #undef USE_LE01MR
#endif

#ifdef USE_BL09XX
  #undef USE_BL09XX
#endif

#ifdef USE_TELEINFO
  #undef USE_TELEINFO
#endif

#ifdef USE_IEM3000
  #undef USE_IEM3000
#endif

#ifdef USE_WE517
  #undef USE_WE517
#endif

#ifdef USE_ENERGY_DUMMY
  #undef USE_ENERGY_DUMMY
#endif

#ifdef USE_SONOFF_SC
  #undef USE_SONOFF_SC
#endif

#ifdef USE_DS18x20
  #undef USE_DS18x20
#endif

#ifdef USE_DHT
  #undef USE_DHT
#endif

#ifdef USE_SHT
  #undef USE_SHT
#endif

#ifdef USE_HTU
  #undef USE_HTU
#endif

#ifdef USE_BMP
  #undef USE_BMP
#endif

#ifdef USE_SHT3X
  #undef USE_SHT3X
#endif

#ifdef USE_LM75AD
  #undef USE_LM75AD
#endif

#ifdef USE_AZ7798
  #undef USE_AZ7798
#endif

#ifdef USE_MAX31855
  #undef USE_MAX31855
#endif

#ifdef USE_MLX90614
  #undef USE_MLX90614
#endif

#ifdef USE_MAX31865
  #undef USE_MAX31865
#endif

#ifdef USE_HIH6
  #undef USE_HIH6
#endif

#ifdef USE_DHT12
  #undef USE_DHT12
#endif

#ifdef USE_DS1624
  #undef USE_DS1624
#endif

#ifdef USE_AHT1x
  #undef USE_AHT1x
#endif

#ifdef USE_HDC1080
  #undef USE_HDC1080
#endif

#ifdef USE_MCP9808
  #undef USE_MCP9808
#endif

#ifdef USE_HP303B
  #undef USE_HP303B
#endif

#ifdef USE_LMT01
  #undef USE_LMT01
#endif

#ifdef USE_AM2320
  #undef USE_AM2320
#endif

#ifdef USE_TIMERS
  #undef USE_TIMERS
#endif
#define USE_TIMERS

#ifdef USE_TUYA_MCU
  #undef USE_TUYA_MCU
#endif

#ifdef USE_WEBSERVER
  #undef USE_WEBSERVER
#endif
#define USE_WEBSERVER

#ifdef USE_WS2812
  #undef USE_WS2812
#endif

#ifdef USE_ZIGBEE
  #undef USE_ZIGBEE
#endif

#ifdef MY_LANGUAGE
  #undef MY_LANGUAGE
#endif
#define MY_LANGUAGE	de_DE

#ifndef USE_SML_M
#define USE_SML_M
#endif
#ifndef USE_SML_SCRIPT_CMD
#define USE_SML_SCRIPT_CMD
#endif
#ifndef USE_GOOGLE_CHARTS
#define USE_GOOGLE_CHARTS
#endif
#ifndef LARGE_ARRAYS
#define LARGE_ARRAYS
#endif
#ifndef USE_SCRIPT_WEB_DISPLAY
#define USE_SCRIPT_WEB_DISPLAY
#endif
#endif

#define KNX_ENABLED            false             // [Knx_Enabled] Enable KNX protocol
#define KNX_ENHANCED           false             // [Knx_Enhanced] Enable KNX Enhanced Mode

#undef USE_KNX_WEB_MENU
#undef USE_KNX

// -- HTTP GUI Colors -----------------------------
// HTML hex color codes. Only 3 and 6 digit hex string values are supported!! See https://www.w3schools.com/colors/colors_hex.asp
// Light theme - pre v7

#define COLOR_TEXT                  "#000"       // [WebColor1] Global text color - Black
#define COLOR_BACKGROUND            "#fff"       // [WebColor2] Global background color - White
#define COLOR_FORM                  "#f2f2f2"    // [WebColor3] Form background color - Greyish
#define COLOR_INPUT_TEXT            "#000"       // [WebColor4] Input text color - Black
#define COLOR_INPUT                 "#fff"       // [WebColor5] Input background color - White
#define COLOR_CONSOLE_TEXT          "#000"       // [WebColor6] Console text color - Black
#define COLOR_CONSOLE               "#fff"       // [WebColor7] Console background color - White
#define COLOR_TEXT_WARNING          "#f00"       // [WebColor8] Warning text color - Red
#define COLOR_TEXT_SUCCESS          "#008000"    // [WebColor9] Success text color - Dark lime green
#define COLOR_BUTTON_TEXT           "#fff"       // [WebColor10] Button text color - White
#define COLOR_BUTTON                "#1fa3ec"    // [WebColor11] Button color - Vivid blue
#define COLOR_BUTTON_HOVER          "#0e70a4"    // [WebColor12] Button color when hovered over - Dark blue
#define COLOR_BUTTON_RESET          "#d43535"    // [WebColor13] Restart/Reset/Delete button color - Strong red
#define COLOR_BUTTON_RESET_HOVER    "#931f1f"    // [WebColor14] Restart/Reset/Delete button color when hovered over - Dark red
#define COLOR_BUTTON_SAVE           "#47c266"    // [WebColor15] Save button color - Moderate lime green
#define COLOR_BUTTON_SAVE_HOVER     "#5aaf6f"    // [WebColor16] Save button color when hovered over - Dark moderate lime green
#define COLOR_TIMER_TAB_TEXT        "#fff"       // [WebColor17] Config timer tab text color - White
#define COLOR_TIMER_TAB_BACKGROUND  "#999"       // [WebColor18] Config timer tab background color - Dark gray
#define COLOR_TITLE_TEXT            "#000"       // [WebColor19] Title text color - Whiteish


#define FRIENDLY_NAME          "Resourcio"   
#define MDNS_ENABLED           true     
#define USER_BACKLOG "Topic Resourcio; SetOption55 1; SetOption141 1; SetOption128 1; DeviceName Resourcio%20Smart%20Meter%20Sensor; FriendlyName Resourcio; OtaUrl https://resourcio-webapp-production.azurewebsites.net/firmware/tasmota32.bin"
