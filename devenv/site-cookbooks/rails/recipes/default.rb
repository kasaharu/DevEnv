#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

log "Install Rails"

directory '/home/vagrant/.chef_exec/' do
  owner  'vagrant'
  group  'vagrant'
  mode   '0755'
  action :create
end

bash "rails install" do
  code <<-EOC
    export PATH="/home/vagrant/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    gem update --system
    gem install --no-ri --no-rdoc rails
  EOC
  creates "/home/vagrant/.chef_exec/rails"
end