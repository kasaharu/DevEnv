#
# Cookbook Name:: android
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

log "Install Android"

directory "#{node["android"]["home"]}/.chef_exec/" do
  owner  node["android"]["owner"]
  group  node["android"]["group"]
  mode   '0755'
  action :create
end

directory "#{node["android"]["home"]}/project/android/" do
  owner  node["android"]["owner"]
  group  node["android"]["group"]
  mode   '0755'
  action :create
  recursive true
end

%w{unzip ant}.each do |pkg|
  package pkg do
    action :install
  end
end


bash "install_sdk" do
  user   node["android"]["user"]
  group  node["android"]["group"]
  code <<-EOS
    cd "#{node["android"]["home"]}/project/android/"
    curl http://dl.google.com/android/adt/22.6.2/adt-bundle-linux-x86_64-20140321.zip -o adt-bundle-linux-x86_64-20140321.zip
    unzip adt-bundle-linux-x86_64-20140321.zip
  EOS
  creates "/home/vagrant/.chef_exec/sdk"
end


bash "install_ndk" do
  user   node["android"]["user"]
  group  node["android"]["group"]
  code <<-EOS
    cd "#{node["android"]["home"]}/project/android/"
    curl http://dl.google.com/android/ndk/android-ndk-r9d-linux-x86_64.tar.bz2 -o android-ndk-r9d-linux-x86_64.tar.bz2
    bzip2 -dc android-ndk-r9d-linux-x86_64.tar.bz2 | tar xvf -
  EOS
  creates "/home/vagrant/.chef_exec/ndk"
end

bash "insert_line_android_path" do
  code <<-EOS
    echo 'export PATH=$PATH:/home/vagrant/project/android/adt-bundle-linux-x86_64-20140321/sdk/platform-tools:/home/vagrant/project/android/adt-bundle-linux-x86_64-20140321/sdk/tools' >> /home/vagrant/.bashrc
    echo 'export NDK_PATH=/home/vagrant/project/android/android-ndk-r9d' >> /home/vagrant/.bashrc
    echo 'export PATH=$PATH:$NDK_PATH' >> /home/vagrant/.bashrc
  EOS
  creates "/home/vagrant/.chef_exec/androidpath"
end

