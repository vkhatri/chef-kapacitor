default['kapacitor']['config']['hostname'] = node['fqdn']

default['kapacitor']['config']['http']['bind-address'] = ':9092'
default['kapacitor']['config']['http']['auth-enabled'] = false
default['kapacitor']['config']['http']['log-enabled'] = true
default['kapacitor']['config']['http']['write-tracing'] = false
default['kapacitor']['config']['http']['pprof-enabled'] = false
default['kapacitor']['config']['http']['https-enabled'] = false
default['kapacitor']['config']['http']['https-certificate'] = '/etc/ssl/kapacitor.pem'

default['kapacitor']['config']['logging']['level'] = 'INFO'

default['kapacitor']['config']['task']['snapshot-interval'] = '60s'

default['kapacitor']['config']['deadman']['global'] = false
default['kapacitor']['config']['deadman']['threshold'] = 0.0
default['kapacitor']['config']['deadman']['interval'] = '10s'
default['kapacitor']['config']['deadman']['id'] = "node 'NODE_NAME' in task '{{ .TaskName }}'"
default['kapacitor']['config']['deadman']['message'] = '{{ .ID }} is {{ if eq .Level "OK" }}alive{{ else }}dead{{ end }}: {{ index .Fields "collected" | printf "%0.3f" }} points/INTERVAL.'

# configure localhost influxdb
default['kapacitor']['default_config_influxdb'] = true

default['kapacitor']['config']['smtp']['enabled'] = false
default['kapacitor']['config']['smtp']['host'] = 'localhost'
default['kapacitor']['config']['smtp']['port'] = 25
default['kapacitor']['config']['smtp']['username'] = ''
default['kapacitor']['config']['smtp']['password'] = ''
default['kapacitor']['config']['smtp']['from'] = ''
default['kapacitor']['config']['smtp']['no-verify'] = false
default['kapacitor']['config']['smtp']['idle-timeout'] = '30s'
default['kapacitor']['config']['smtp']['global'] = false
default['kapacitor']['config']['smtp']['state-changes-only'] = false

default['kapacitor']['config']['opsgenie']['enabled'] = false
default['kapacitor']['config']['opsgenie']['api-key'] = ''
default['kapacitor']['config']['opsgenie']['url'] = 'https://api.opsgenie.com/v1/json/alert'
default['kapacitor']['config']['opsgenie']['recovery_url'] = 'https://api.opsgenie.com/v1/json/alert/note'
default['kapacitor']['config']['opsgenie']['global'] = false

default['kapacitor']['config']['victorops']['enabled'] = false
default['kapacitor']['config']['victorops']['api-key'] = ''
default['kapacitor']['config']['victorops']['routing-key'] = ''
default['kapacitor']['config']['victorops']['url'] = 'https://alert.victorops.com/integrations/generic/20131114/alert'
default['kapacitor']['config']['victorops']['global'] = false

default['kapacitor']['config']['pagerduty']['enabled'] = false
default['kapacitor']['config']['pagerduty']['service-key'] = ''
default['kapacitor']['config']['pagerduty']['url'] = 'https://events.pagerduty.com/generic/2010-04-15/create_event.json'
default['kapacitor']['config']['pagerduty']['global'] = false

default['kapacitor']['config']['slack']['enabled'] = false
default['kapacitor']['config']['slack']['url'] = ''
default['kapacitor']['config']['slack']['channel'] = ''
default['kapacitor']['config']['slack']['global'] = false
default['kapacitor']['config']['slack']['state-changes-only'] = false

default['kapacitor']['config']['hipchat']['enabled'] = false
default['kapacitor']['config']['hipchat']['url'] = 'https://subdomain.hipchat.com/v2/room'
default['kapacitor']['config']['hipchat']['room'] = ''
default['kapacitor']['config']['hipchat']['token'] = ''
default['kapacitor']['config']['hipchat']['global'] = false
default['kapacitor']['config']['hipchat']['state-changes-only'] = false

default['kapacitor']['config']['alerta']['enabled'] = false
default['kapacitor']['config']['alerta']['url'] = ''
default['kapacitor']['config']['alerta']['token'] = ''
default['kapacitor']['config']['alerta']['environment'] = ''
default['kapacitor']['config']['alerta']['origin'] = 'kapacitor'

default['kapacitor']['config']['sensu']['enabled'] = false
default['kapacitor']['config']['sensu']['addr'] = 'sensu-client:3030'
default['kapacitor']['config']['sensu']['source'] = 'Kapacitor'

default['kapacitor']['config']['reporting']['enabled'] = true
default['kapacitor']['config']['reporting']['url'] = 'https://usage.influxdata.com'

default['kapacitor']['config']['stats']['enabled'] = true
default['kapacitor']['config']['stats']['stats-interval'] = '10s'
default['kapacitor']['config']['stats']['database'] = '_kapacitor'
default['kapacitor']['config']['stats']['retention-policy'] = 'default'

default['kapacitor']['config']['udf']['functions'] = {}

default['kapacitor']['config']['talk']['enabled'] = false

default['kapacitor']['config']['talk']['url'] = 'https://jianliao.com/v2/services/webhook/uuid'
default['kapacitor']['config']['talk']['author_name'] = 'Kapacitor'

default['kapacitor']['config']['collectd']['enabled'] = false
default['kapacitor']['config']['collectd']['bind-address'] = ':25826'
default['kapacitor']['config']['collectd']['database'] = 'collectd'
default['kapacitor']['config']['collectd']['retention-policy'] = ''
default['kapacitor']['config']['collectd']['batch-size'] = 1000
default['kapacitor']['config']['collectd']['batch-pending'] = 5
default['kapacitor']['config']['collectd']['batch-timeout'] = '10s'
default['kapacitor']['config']['collectd']['typesdb'] = '/usr/share/collectd/types.db'

default['kapacitor']['config']['opentsdb']['enabled'] = false
default['kapacitor']['config']['opentsdb']['bind-address'] = ':4242'
default['kapacitor']['config']['opentsdb']['database'] = 'opentsdb'
default['kapacitor']['config']['opentsdb']['retention-policy'] = ''
default['kapacitor']['config']['opentsdb']['consistency-level'] = 'one'
default['kapacitor']['config']['opentsdb']['tls-enabled'] = false
default['kapacitor']['config']['opentsdb']['certificate'] = '/etc/ssl/influxdb.pem'
default['kapacitor']['config']['opentsdb']['batch-size'] = 1000
default['kapacitor']['config']['opentsdb']['batch-pending'] = 5
default['kapacitor']['config']['opentsdb']['batch-timeout'] = '1s'
