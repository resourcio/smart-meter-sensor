    FOOTER_RESOURCIO="\"<div style='text-align:right;font-size:11px;'><hr/><a href=\'https:\/\/resourcio.de\' target=\'_blank\' style=\'color:#aaa;\'>Resourcio SMS %%%%%VERSION_PLACEHOLDER%%%%% powered by </a>"
    FOOTER="\"<div style='text-align:right;font-size:11px;'><hr/>"
    sed -i '' "s|$FOOTER|$FOOTER_RESOURCIO|1" "tasmota/tasmota_xdrv_driver/xdrv_01_9_webserver.ino"
    cp ../autoexec.be autoexec.be
    cp ../script.txt script.txt
    cd $rundir

