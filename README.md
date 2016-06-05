kapacitor Cookbook
================

[![Cookbook](http://img.shields.io/badge/cookbook-v0.0.1-green.svg)](https://github.com/vkhatri/chef-kapacitor)

[![wercker status](https://app.wercker.com/status/4db502d59b112195391912b4679eee7d/m "wercker status")](https://app.wercker.com/project/bykey/4db502d59b112195391912b4679eee7d)


This is a [Chef] cookbook to manage [InfluxDB] [Kapacitor].


>> For Production environment, always prefer the [most recent release](https://supermarket.chef.io/cookbooks/kapacitor).


## Most Recent Release

```ruby
cookbook 'kapacitor', '~> 0.0.1'
```

## From Git

```ruby
cookbook 'kapacitor', github: 'vkhatri/chef-kapacitor',  tag: "v0.0.1"
```

## Repository

```
https://github.com/vkhatri/chef-kapacitor
```

## Supported OS

This cookbook was tested on Amazon & Ubuntu Linux and expected to work on other RHEL platforms.



## Cookbook Dependency

None


## Recipes

- `kapacitor::default` - default recipe (use it for run_list)

- `kapacitor::install` - install kapacitor

- `kapacitor::config` - configure kapacitor

- `kapacitor::inputs` - configure kapacitor inputs using node attribute `node['kapacitor']['inputs']`

- `kapacitor::outputs` - configure kapacitor outputs using node attribute `node['kapacitor']['outputs']`

- `kapacitor::service` - configure kapacitor service

- `kapacitor::example` - examples recipe to configure default inputs/outputs using HWRP


## Core Attributes


* `default['kapacitor']['version']` (default: `nil`): kapacitor version, default install latest

* `default['kapacitor']['conf_dir']` (default: `/etc/kapacitor`): kapacitor toml configuration file directory

* `default['kapacitor']['data_dir']` (default: `/var/lib/kapacitor`): kapacitor data directory

* `default['kapacitor']['log_dir']` (default: `/var/log/kapacitor`): kapacitor log directory

* `default['kapacitor']['conf_file']` (default: `/etc/kapacitor/kapacitor.conf`): kapacitor configuration file

* `default['kapacitor']['notify_restart']` (default: `true`): whether to restart kapacitor service on configuration file change

* `default['kapacitor']['disable_service']` (default: `false`): whether to stop and disable kapacitor service

* `default['kapacitor']['user']` (default: `kapacitor`): kapacitor user

* `default['kapacitor']['group']` (default: `kapacitor`): kapacitor group



## Configuration File kapacitor.conf Attributes


## kapacitor YUM/APT Repository Attributes

* `default['kapacitor']['yum']['description']` (default: ``): kapacitor yum reporitory attribute

* `default['kapacitor']['yum']['gpgcheck']` (default: `true`): kapacitor yum reporitory attribute

* `default['kapacitor']['yum']['enabled']` (default: `true`): kapacitor yum reporitory attribute

* `default['kapacitor']['yum']['baseurl']` (default: `calculated`): kapacitor yum reporitory attribute

* `default['kapacitor']['yum']['gpgkey']` (default: `https://repos.influxdata.com/influxdb.key`): kapacitor yum reporitory attribute

* `default['kapacitor']['yum']['action']` (default: `:create`): kapacitor yum reporitory attribute


* `default['kapacitor']['apt']['description']` (default: ``): kapacitor apt reporitory attribute

* `default['kapacitor']['apt']['components']` (default: `['stable']`): kapacitor apt reporitory attribute

* `default['kapacitor']['apt']['uri']` (default: `https//repos.influxdata.com/debian`): kapacitor apt reporitory attribute

* `default['kapacitor']['apt']['key']` (default: `https//repos.influxdata.com/influxdb.key`): kapacitor apt reporitory attribute

* `default['kapacitor']['apt']['action']` (default: `:add`): kapacitor apt reporitory attribute


## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests (`rake & rake knife`), ensuring they all pass
6. Write new resource/attribute description to `README.md`
7. Write description about changes to PR
8. Submit a Pull Request using Github


## Copyright & License

Authors:: Virender Khatri and [Contributors]

<pre>
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
</pre>


[Chef]: https://www.chef.io/
[Kapacitor]: https://docs.influxdata.com/kapacitor
[InfluxDB]: https://influxdata.com/
[Contributors]: https://github.com/vkhatri/chef-kapacitor/graphs/contributors
