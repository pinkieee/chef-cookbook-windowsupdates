#
# Cookbook Name:: attrtest
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

default[:windowsupdate][:schedule]=:weekly
default[:windowsupdate][:download][:schedule_time]="03:00"
default[:windowsupdate][:install][:schedule_time]="05:00"