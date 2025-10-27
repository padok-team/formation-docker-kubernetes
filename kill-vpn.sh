# le kill : 
        launchctl bootout gui/$(id -u) /Library/LaunchAgents/com.paloaltonetworks.gp.pangps.plist > /dev/null 2>&1
        launchctl bootout gui/$(id -u) /Library/LaunchAgents/com.paloaltonetworks.gp.pangpa.plist > /dev/null 2>&1
        PID="$(launchctl list | grep palo | cut -f 1)"

        if [ ! -z "$PID" ]; then
                kill -9 $PID
        fi

        echo "VPN unloaded"
#le up (parfois plus capricieux à redémarrer...):

        launchctl bootstrap gui/$(id -u) /Library/LaunchAgents/com.paloaltonetworks.gp.pangps.plist
        launchctl bootstrap gui/$(id -u) /Library/LaunchAgents/com.paloaltonetworks.gp.pangpa.plist
        open -a /Applications/GlobalProtect.app
        echo "VPN loaded"
        # pour le up ya possiblement une pop-up qui part jamais