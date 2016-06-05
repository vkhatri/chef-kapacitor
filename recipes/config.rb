#
# Cookbook Name:: kapacitor
# Recipe:: config
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

require 'toml'

[node['kapacitor']['data_dir'],
 node['kapacitor']['log_dir']].each do |d|
  directory d do
    owner node['kapacitor']['user']
    group node['kapacitor']['group']
    mode '0755'
  end
end

file node['kapacitor']['conf_file'] do
  content TOML.dump(node['kapacitor']['config'])
  notifies :restart, 'service[kapacitor]' if node['kapacitor']['notify_restart'] && !node['kapacitor']['disable_service']
end
