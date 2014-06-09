#
# Cookbook Name:: vim
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

log "Install Vim"
package "vim" do
  action :install
end

template "#{node["vim"]["home"]}/.vimrc" do
  source "vimrc.erb"
  owner  node["vim"]["owner"]
  group  node["vim"]["group"]
  mode 0644
end
