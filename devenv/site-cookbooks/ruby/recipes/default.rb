#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

log "Install Ruby"

directory "#{node["ruby"]["home"]}/.chef_exec/" do
  owner  node["ruby"]["owner"]
  group  node["ruby"]["group"]
  mode   '0755'
  action :create
end

%w{build-essential curl zlib1g-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev sqlite3 libsqlite3-dev nodejs make gcc ncurses-dev libgdbm-dev libffi-dev tk-dev openssl readline-common libdb5.3-dev}.each do |pkg|
  package pkg do
    action :install
  end
end

git "/home/vagrant/.rbenv" do
  repository "git://github.com/sstephenson/rbenv.git"
  reference "master"
  action :sync
  user   node["ruby"]["user"]
  group  node["ruby"]["group"]
end

%w{/home/vagrant/.rbenv/plugins}.each do |dir|
  directory dir do
    action :create
    user   node["ruby"]["user"]
    group  node["ruby"]["group"]
  end
end

git "#{node["ruby"]["home"]}/.rbenv/plugins/ruby-build" do
  repository "git://github.com/sstephenson/ruby-build.git"
  reference "master"
  action :sync
  user   node["ruby"]["user"]
  group  node["ruby"]["group"]
end


bash "insert_line_rbenvpath" do
  code <<-EOS
    echo 'export PATH="/home/vagrant/.rbenv/bin:$PATH"' >> /home/vagrant/.bashrc
    echo 'eval "$(rbenv init -)"' >> /home/vagrant/.bashrc
  EOS
  creates "/home/vagrant/.chef_exec/rbenvpath"
end


bash "install ruby" do
  user   node["ruby"]["user"]
  group  node["ruby"]["group"]
  code <<-EOS
    curl -fsSL https://gist.github.com/mislav/a18b9d7f0dc5b9efc162.txt | /home/vagrant/.rbenv/bin/rbenv install --patch 2.1.1
    /home/vagrant/.rbenv/bin/rbenv rehash
    /home/vagrant/.rbenv/bin/rbenv global 2.1.1
  EOS
  creates "#{node["ruby"]["home"]}/.chef_exec/ruby"
end

