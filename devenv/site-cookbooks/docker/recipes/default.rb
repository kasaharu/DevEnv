#
# Cookbook Name:: docker
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

log "Install Git"

directory '/home/vagrant/.chef_exec/' do
  owner  'vagrant'
  group  'vagrant'
  mode   '0755'
  action :create
end

package "docker.io" do
  action :install
end

bash "insert_line_rbenvpath" do
  code <<-EOS
    ln -sf /usr/bin/docker.io /usr/local/bin/docker
  EOS
  creates "/home/vagrant/.chef_exec/docker"
end

