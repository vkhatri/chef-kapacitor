# resources/handler.rb
#
# Handler resource for Kapacitor

property :id, String, name_property: true
property :host, String, default: 'localhost'
property :port, Integer, default: 9092
property :topic, String
property :actions, Array

default_action :create

include KapacitorCookbook::KapacitorApi

action :create do
  options = {
    host: new_resource.host,
    port: new_resource.port
  }
  handler_options = {
    id: new_resource.id
  }
  handler_options.merge!(new_resource.actions[0])

  # Find wether handler already exists
  handler = get_handler(options, new_resource.topic, handler_options[:id])

  # If not found let's create it
  if handler.nil?
    converge_by("Creating handler #{new_resource.name}") do
      create_handler(options, new_resource.topic, handler_options)
    end
  end
end
