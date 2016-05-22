#
# Cookbook Name:: etcd
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


remote_file '/usr/local/bin/etcd-v2.3.5-linux-amd64.tar.gz' do
   source 'https://github.com/coreos/etcd/releases/download/v2.3.5/etcd-v2.3.5-linux-amd64.tar.gz'
 end

 execute 'extract_some_tar' do
  command 'tar -xzvf etcd-v2.3.5-linux-amd64.tar.gz'
  cwd '/usr/local/bin/'
end

# create directory for etcd data
directory '/var/etcd' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# create upstart script for etcd service
template '/etc/init/etcd.conf' do
  source 'etcd.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

# enable and start etcd service
service "etcd" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end

# download cert file
remote_file '/tmp/rds-combined-ca-bundle.pem' do
  source 'http://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem'
  owner 'ubuntu'
  group 'ubuntu'
  mode '0400'
  action :create
end
