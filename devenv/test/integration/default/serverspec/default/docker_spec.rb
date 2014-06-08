require 'spec_helper'

describe package('docker.io') do
  it { should be_installed }
end

describe file('/usr/local/bin/docker') do
  it { should be_file }
end

