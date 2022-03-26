#!/bin/sh
rm ~/Library/LaunchAgents/com.bkahlert.mac.health-checks.plist
rm ~/.health-checks.sh
[ -f ~/Library/LaunchAgents/com.bkahlert.mac.health-checks.plist ] || cp ~/Library/Mobile\ Documents/com~apple~CloudDocs/Setup/macOS/com.bkahlert.mac.health-checks.plist ~/Library/LaunchAgents/com.bkahlert.mac.health-checks.plist
[ -f ~/.health-checks.sh ] || cp ~/Library/Mobile\ Documents/com~apple~CloudDocs/Setup/macOS/com.bkahlert.mac.health-checks.sh ~/.health-checks.sh; chmod +x ~/.health-checks.sh
curl -LfsS -k -m 10 --retry 5 https://hc-ping.com/6f94b61e-adb7-4b79-ae6f-cc14a3ac702e/start
m=$(nc -4zuvv -w 5 1.1.1.1 53 2>&1 && dig $(cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1).home.bkahlert.com -4 -t A +expire=1 +showsearch +time=10 +trace 2>&1 && curl -fSkLNv -m 5 --retry 3 https://bkahlert.com 2>&1 | grep -qF "Kahlert" 2>&1)
echo $m >> ~/.health-checks.log
curl -LfsS -k -m 10 --retry 5 --data-raw "$m" "https://hc-ping.com/6f94b61e-adb7-4b79-ae6f-cc14a3ac702e$([ $? -ne 0 ] && echo -n /fail)"
