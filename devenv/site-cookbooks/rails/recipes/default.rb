#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

log "Install Rails"

directory  "#{node["rails"]["home"]}/.chef_exec/" do
  owner  node["rails"]["owner"]
  group  node["rails"]["group"]
  mode   '0755'
  action :create
end

bash "rails install" do
  code <<-EOC
    export PATH="#{node["rails"]["home"]}/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    gem update --system
    gem install --no-ri --no-rdoc rails
  EOC
  creates "#{node["rails"]["home"]}/.chef_exec/rails"
end
