#!/usr/bin/expect

set timeout 5
spawn chsh -s /usr/bin/zsh
expect "Password:"
send "vagrant\n"
interact
