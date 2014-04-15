#
# Cookbook Name:: ntp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

type = case node['platform_family']
    when "rhel", "fedora"
        "yum"
    when "debian"
        "apt"
    else
        # TODO
        "other_package"
end

execute "autorun_ntp" do
    command "#{node['ntp'][type]['autorun_cmd']}"
    action :nothing
end

package "ntp" do
    action :install
    notifies :run, "execute[autorun_ntp]", :delayed
end

service "#{node['ntp'][type]['service_name']}" do
    supports :status => true, :restart => true
end

template "#{node['ntp']['conf']}" do
    source "ntp.conf.erb"
    action :create
    notifies :restart, "service[#{node['ntp'][type]['service_name']}]", :delayed
end
