#!/usr/bin/expect -f

spawn /usr/sbin/service ssh start
spawn netExtender --auto-reconnect -u foo -p bar -d LocalDomain domain.com

expect "Do you want to proceed?"
send "y\r"
expect "Do you want to proceed?"
send "y\r"
interact
