require 'spec_helper'

describe package('vim') do
  it { should be_installed }
end

describe file('/home/vagrant/.vimrc') do
  it { should be_file }
end

