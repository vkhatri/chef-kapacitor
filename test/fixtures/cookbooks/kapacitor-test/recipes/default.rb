include_recipe 'kapacitor::default'

# Service start
service 'kapacitor' do
  action :restart
end

# Create a test task
kapacitor_task 'test' do
  id 'cpu_alert'
  type 'stream'
  dbrps [{ 'db' => 'collectd', 'rp' => 'one_hour' }]
  script "stream\n    // Select just the cpu measurement from our example database.\n    |from()\n        .measurement('cpu_value')\n        .where(lambda: \"type_instance\" == 'idle' AND \"type\" == 'percent')\n    |alert()\n        .crit(lambda: \"value\" \u003c 70)\n        // Whenever we get an alert write it to a file.\n        .log('/tmp/alerts.log')\n"
  action %i[create enable]
end

# Create a test hendler
kapacitor_handler 'test_handler' do
    id 'test_handler'
    topic 'test'
    actions [{'kind' => 'log', 'options' => { 'path' => '/tmp/alerts.log' } }]
    action :create
end
