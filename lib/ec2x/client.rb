class Ec2x::Client < EventMachine::Connection
  # == Constants ============================================================
  
  # == Class Methods ========================================================

  def self.run(config)
    unless (config[:remote_host] and config[:remote_port])
      raise Ec2x::Exception, "Configuration of remote server not specified."
    end
    
    EventMachine::connect(config[:remote_host], config[:remote_port], self, config)
  end

  # == Instance Methods =====================================================
  
  def initialize(config)
    super()
    
    @config = config

    if (@config.verbose? and !@config.interactive?)
      puts "EC2x Agent (ec2x-agent #{Ec2x::Config.version})"
    end
  end
  
  def connection_completed
  end
  
  def receive_data(data)
    data = data.chomp
    
    case (data)
    when 'HELO'
      send_data("HELO #{Ec2x::Config.version}")
    end
    # ...
  end

protected
  def log_activity(message)
    puts Time.now.strftime("[%Y-%m-%d %H:%M:%S %z] ") + message
  end
end
