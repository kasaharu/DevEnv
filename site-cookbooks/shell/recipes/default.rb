#
# Cookbook Name:: shell
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

log "Setting shell"

%w{curl zsh expect}.each do |pkg|
  package pkg do
    action :install
  end
end

cookbook_file "/home/vagrant/setup_oh_my_zsh.sh" do
  source "setup_oh_my_zsh.sh"
  user "vagrant"
  group "vagrant"
  mode 0755
end

cookbook_file "/home/vagrant/change_shell.sh" do
  source "change_shell.sh"
  user "vagrant"
  group "vagrant"
  mode 0755
end

bash "setup oh-my-zsh" do
  user "vagrant"
  group "vagrant"
  code <<-EOS
  expect /home/vagrant/setup_oh_my_zsh.sh
  EOS
end

bash "change shell to zsh" do
  user "vagrant"
  group "vagrant"
  code <<-EOS
  expect /home/vagrant/change_shell.sh
  EOS
end


