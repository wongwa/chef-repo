#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

#package "apache2" do 
#  action :install
#end

#service "apache2"  do
#  action [ :enable,  :start ]
#end



package 'apache2' do
  case node[:platform]
  when 'redhat','centos'
     package_name 'httpd'
     action    :install
  when 'ubuntu','debian'
     package_name 'apache2'
     action :install
  end
end

service "apache2"  do
  case node[:platform]
  when 'redhat','centos'
     service_name 'httpd'
  when 'ubuntu','debian'
     service_name 'apache2'
  end
  action [ :enable,  :start ]
end

template "/var/www/html/index.html" do 
  source 'index.html.erb'
  mode '0644'
end


