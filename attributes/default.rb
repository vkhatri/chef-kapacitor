default['kapacitor']['version'] = nil
default['kapacitor']['disable_service'] = false

default['kapacitor']['user'] = 'kapacitor'
default['kapacitor']['group'] = 'kapacitor'

default['kapacitor']['notify_restart'] = true
default['kapacitor']['conf_dir'] = '/etc/kapacitor'
default['kapacitor']['data_dir'] = '/var/lib/kapacitor'
default['kapacitor']['log_dir'] = '/var/log/kapacitor'
default['kapacitor']['conf_file'] = ::File.join(node['kapacitor']['conf_dir'], 'kapacitor.conf')

default['kapacitor']['yum']['baseurl'] = value_for_platform(
  %w(amazon) => { 'default' => 'https://repos.influxdata.com/rhel/6/$basearch/stable' },
  %w(centos redhat fedora) => { 'default' => 'https://repos.influxdata.com/rhel/6/$basearch/stable' }
)

default['kapacitor']['yum']['description'] = 'InfluxDB Repository - RHEL $releasever'
default['kapacitor']['yum']['gpgcheck'] = true
default['kapacitor']['yum']['enabled'] = true
default['kapacitor']['yum']['gpgkey'] = 'https://repos.influxdata.com/influxdb.key'
default['kapacitor']['yum']['action'] = :create

default['kapacitor']['apt']['uri'] = 'https://repos.influxdata.com/debian'
default['kapacitor']['apt']['description'] = 'InfluxDB Repository'
default['kapacitor']['apt']['components'] = %w(stable)
# default['kapacitor']['apt']['distribution'] = ''
default['kapacitor']['apt']['action'] = :add
default['kapacitor']['apt']['key'] = 'https://repos.influxdata.com/influxdb.key'
