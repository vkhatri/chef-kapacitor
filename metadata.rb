name             'kapacitor'
maintainer       'Virender Khatri'
maintainer_email 'vir.khatri@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures InfluxdB Kapacitor'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.2'

source_url 'https://github.com/vkhatri/chef-kapacitor' if respond_to?(:source_url)
issues_url 'https://github.com/vkhatri/chef-kapacitor/issues' if respond_to?(:issues_url)

%w(ubuntu centos amazon redhat fedora).each do |os|
  supports os
end
