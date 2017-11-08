# resources/task.rb
#
# Resource for Kapacitor

property :id, String, name_property: true
property :host, String, default: 'localhost'
property :port, Integer, default: 9092
property :type, String
property :dbrps, Array
property :script, String
property :vars, Hash

default_action :create

include KapacitorCookbook::KapacitorApi

action :create do
  options = {
    host: new_resource.host,
    port: new_resource.port
  }
  task_options = {
    id: new_resource.id,
    type: new_resource.type,
    dbrps: new_resource.dbrps,
    script: new_resource.script,
    vars: new_resource.vars
  }

  # Find wether task already exists
  task = get_task(options, task_options)

  # If not found let's create it
  if task.nil?
    converge_by("Creating task #{new_resource.name}") do
      create_task(options, task_options)
    end
  end
end

action :enable do
  options = {
    host: new_resource.host,
    port: new_resource.port
  }
  task_options = {
    id: new_resource.id
  }

  # Find wether task already exists
  task = get_task(options, task_options)

  # If already exist enable
  if task
    converge_by("Enable task #{new_resource.name}") do
      enable_task(options, task_options)
    end
  end
end

action :delete do
  options = {
    host: new_resource.host,
    port: new_resource.port
  }
  task_options = {
    id: new_resource.id
  }

  # Find wether task already exists
  task = get_task(options, task_options)

  # If already exist enable
  if task
    converge_by("Delete task #{new_resource.name}") do
      delete_task(options, task_options)
    end
  end
end
