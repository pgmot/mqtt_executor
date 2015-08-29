require 'mqtt'
require 'json'
require_relative './command'

host = ENV['MQTT_HOST']
username = ENV['MQTT_USER']
password = ENV['MQTT_PASS']

MQTT::Client.connect(:remote_host => host, :username => username, :password => password) do |c|
  c.get(username) do |topic, message|
    puts "#{topic}: #{message}"
    json = JSON.parse(message)
    Command.exec(message['payload']['command'])
  end
end
