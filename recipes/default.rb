#
# Cookbook Name:: windowsupdate
# Recipe:: default
#
# Copyright 2013, Cloudreach
#
# Cookbook Name:: windowsupdate
# Recipe:: default
#
# Copyright 2013, Cloudreach
#
# All rights reserved - Do Not Redistribute
#

#include_recipe "windowsupdate::wutask"


pw = search(:"AMAZONA-0ECCAAU", "id:windows").first

directory "C:/cloudreach" do
  action :create
 end

cookbook_file "C:/cloudreach/dlcritupdates.ps1" do
  source "dlcritupdates.ps1"
end

cookbook_file "C:/cloudreach/installcritupdatesreboot.ps1" do
  source "installcritupdatesreboot.ps1"
end

windows_task "dlcritupdates" do
  user "Administrator"
  password pw["password"]
  cwd "C:/windows/system32/windowspowershell/v1.0/"
  command "powershell.exe C:/cloudreach/dlcritupdates.ps1"
  run_level :highest
  frequency node[:windowsupdate][:schedule]
  start_time node[:windowsupdate][:download][:schedule_time]
end

windows_task "installcritupdatesreboot" do
  user "Administrator"
  password pw["password"]
  cwd "C:/windows/system32/windowspowershell/v1.0/"
  command "powershell.exe C:/cloudreach/installcritupdatesreboot.ps1"
  run_level :highest
  frequency node[:windowsupdate][:schedule]
  start_time node[:windowsupdate][:install][:schedule_time]
end