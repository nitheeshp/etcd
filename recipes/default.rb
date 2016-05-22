#
# Cookbook Name:: etcd2
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


# download cert file
remote_file '/tmp/rds-combined-ca-bundle.pem' do
  source 'http://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem'
  owner 'ec2-user'
  group 'ec2-user'
  mode '0400'
  action :create
end
