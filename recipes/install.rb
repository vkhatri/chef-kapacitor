#
# Cookbook Name:: kapacitor
# Recipe:: install
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

case node['platform_family']
when 'debian'
  package 'apt-transport-https'

  if node['kapacitor']['setup_repository']
    apt_repository 'influxdb' do
      uri node['kapacitor']['apt']['uri']
      components node['kapacitor']['apt']['components']
      key node['kapacitor']['apt']['key']
      distribution node['kapacitor']['apt']['distribution']
      action node['kapacitor']['apt']['action']
    end

    unless node['kapacitor']['ignore_version'] # ~FC023
      apt_preference 'kapacitor' do
        pin          "version #{node['kapacitor']['version']}"
        pin_priority '700'
      end
    end
  end
when 'rhel'
  if node['kapacitor']['setup_repository']
    yum_repository 'influxdb' do
      description node['kapacitor']['yum']['description']
      baseurl node['kapacitor']['yum']['baseurl']
      gpgcheck node['kapacitor']['yum']['gpgcheck']
      gpgkey node['kapacitor']['yum']['gpgkey']
      enabled node['kapacitor']['yum']['enabled']
      action node['kapacitor']['yum']['action']
    end

    unless node['kapacitor']['ignore_version'] # ~FC023
      yum_version_lock 'kapacitor' do
        version node['kapacitor']['version']
        release node['kapacitor']['release']
        action :update
      end
    end
  end
end

kapacitor_version = node['kapacitor']['version'] + '-' + node['kapacitor']['release']
package 'kapacitor' do
  version kapacitor_version unless node['kapacitor']['ignore_version']
  notifies :restart, 'service[kapacitor]' if node['kapacitor']['notify_restart'] && !node['kapacitor']['disable_service']
end
