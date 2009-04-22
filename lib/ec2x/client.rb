class Ec2x::Client < EventMachine::Protocols::LineAndTextProtocol
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
    super
    
    @config = config
  end

  def post_init
    super
    
    if (@config.verbose? and !@config.interactive?)
      puts "EC2x Agent (ec2x-agent #{Ec2x::Config.version})"
    end
  end
  
  def connection_completed
    @config.logger.log(:debug, "Connected to server")
  end
  
  def receive_line(data)
    if (data.match(/^HELO (\S+)/))
      send_data("HELO ec2x/#{Ec2x::Config.version}\n")
      @connection = :open
    else
      puts "? #{data}"
    end
  end
  
  def unbind
    super
    
    @connection = nil
  end
  
  # -- Functions ------------------------------------------------------------
  
  def ping
    send_data("PING\n")
  end
end
