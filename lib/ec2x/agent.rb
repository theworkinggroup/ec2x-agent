class Ec2x::Agent
  # == Constants ============================================================
  
  # == Class Methods ========================================================
  
  def self.run(options = { })
    self.new(options).run
  end

  # == Instance Methods =====================================================
  
  def initialize(options = { })
    @options = options

    if (@options[:verbose] and !@options[:interactive])
      puts "EC2x Agent (ec2x-agent #{Ec2x::Config.version})"
    end

    @config = @options[:config] ||= Ec2x::Config.new(@options)
  end
  
  def connect
    return if (@socket)
    
    begin
      uri = URI.parse(@config[:master_url])
    
      @socket = TCPSocket.new(
        uri.host,
        uri.port || @config[:default_port]
      )
    
      # EventMachine.attach()
    rescue Errno::ECONNREFUSED
      log_activity "Could not connect to server #{@config[:master_url]}" if (@options[:verbose])
    end
  end
  
  def run
    log_activity("Agent started")
    sleep(10000)
  end
  
protected
  def log_activity(message)
    puts Time.now.strftime("[%Y-%m-%d %H:%M:%S %z] ") + message
  end
end
