#
# Cookbook Name:: update
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

log "Run apt-get update"
execute "apt-get update" do
  action :run
end
