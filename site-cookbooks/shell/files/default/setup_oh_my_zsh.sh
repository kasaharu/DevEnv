#!/usr/bin/expect

set timeout 5
spawn curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
expect "Password:"
send "vagrant\n"
interact
