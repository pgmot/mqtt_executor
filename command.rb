
class Command
  def self.channel_up
    system('sudo ./sendir tv_channel_up.txt 3 > /dev/null')
    puts "channel_up!"
  end

  def self.channel_down
    system('sudo ./sendir tv_channel_down.txt 3 > /dev/null')
    puts "channel_down!"
  end

  def self.tv_power
    system('sudo ./sendir tv_power_on.txt 3 > /dev/null')
    puts "tv_power!"
  end

  def self.command_list
    Command.methods(false).join("\n")
  end

  def self.exec(command)
    case command
    when 'channel_up'
      Command.channel_up
    when 'channel_down'
      Command.channel_down
    when 'tv_power'
      Command.tv_power
    else
      puts "#{command} command not found..."
    end
  end
end
