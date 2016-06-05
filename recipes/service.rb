#
# Cookbook Name:: kapacitor
# Recipe:: service
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

ruby_block 'delay kapacitor service start' do
  block do
  end
  notifies :start, 'service[kapacitor]'
  not_if { node['kapacitor']['disable_service'] }
end

service_action = node['kapacitor']['disable_service'] ? [:disable, :stop] : [:enable, :nothing]

service 'kapacitor' do
  supports :status => true, :restart => true
  action service_action
end
