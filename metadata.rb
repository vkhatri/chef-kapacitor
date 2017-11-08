name             'kapacitor'
maintainer       'Virender Khatri'
maintainer_email 'vir.khatri@gmail.com'
license          'Apache-2.0'
description      'Installs/Configures Influxdata Kapacitor'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.4'

source_url 'https://github.com/vkhatri/chef-kapacitor' if respond_to?(:source_url)
issues_url 'https://github.com/vkhatri/chef-kapacitor/issues' if respond_to?(:issues_url)

chef_version '>= 12' if respond_to?(:chef_version)

depends 'apt'
depends 'yum-plugin-versionlock', '>= 0.1.2'

%w[ubuntu centos amazon redhat fedora].each do |os|
  supports os
end

depends 'compat_resource'
