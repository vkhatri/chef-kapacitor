#
# Cookbook Name:: kapacitor
# Recipe:: default
#
# Copyright 2015, Virender Khatri
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node.default['kapacitor']['config']['data_dir'] = node['kapacitor']['data_dir']
node.default['kapacitor']['config']['replay']['dir'] = ::File.join(node['kapacitor']['data_dir'], 'replay')
node.default['kapacitor']['config']['task']['dir'] = ::File.join(node['kapacitor']['data_dir'], 'tasks')
node.default['kapacitor']['config']['storage']['boltdb'] = ::File.join(node['kapacitor']['data_dir'], 'kapacitor.db')
node.default['kapacitor']['config']['logging']['file'] = ::File.join(node['kapacitor']['log_dir'], 'kapacitor.log')

if node['kapacitor']['default_config_influxdb']
  node.default['kapacitor']['config']['influxdb'] = [
    {
      'enabled' => true,
      'default' => true,
      'name' => 'localhost',
      'urls' => [
        'http://localhost:8086'
      ],
      'username' => '',
      'password' => '',
      'timeout' => 0,
      'insecure-skip-verify' => false,
      'udp-buffer' => 1_000,
      'udp-read-buffer' => 0,
      'subscriptions' => {},
      'excluded-subscriptions' => {}
    }
  ]
end

if Chef::Resource::ChefGem.method_defined?(:compile_time)
  chef_gem 'toml-rb' do
    compile_time true
  end
else
  chef_gem 'toml-rb' do
    action :nothing
  end.run_action(:install)
end

include_recipe 'kapacitor::install'
include_recipe 'kapacitor::config'
include_recipe 'kapacitor::service'
