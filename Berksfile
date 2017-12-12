source 'https://supermarket.chef.io'

metadata

group :integration do
  cookbook 'apt'
  cookbook 'influxdb'
end

group :test do
  cookbook 'kapacitor-test', path: 'test/fixtures/cookbooks/kapacitor-test'
  cookbook 'curl'
end
