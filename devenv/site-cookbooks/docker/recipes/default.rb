#
# Cookbook Name:: docker
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

log "Install Git"

directory "#{node["docker"]["home"]}/.chef_exec/" do
  owner  node["docker"]["owner"]
  group  node["docker"]["group"]
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
  creates "#{node["docker"]["home"]}/.chef_exec/docker"
end

