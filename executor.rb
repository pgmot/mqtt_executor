require 'mqtt'
require_relative './command'

host = ENV['MQTT_HOST']
username = ENV['MQTT_USER']
password = ENV['MQTT_PASS']

MQTT::Client.connect(:remote_host => host, :username => username, :password => password) do |c|
  c.get(username) do |topic, message|
    Command.exec(message['command'])
  end
end
