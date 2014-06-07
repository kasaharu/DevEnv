require 'spec_helper'

describe file('/home/vagrant/.rbenv') do
  it { should be_directory }
end

describe file('/home/vagrant/.rbenv/plugins') do
  it { should be_directory }
end

describe file('/home/vagrant/.rbenv/plugins/ruby-build') do
  it { should be_directory }
end

