class Ec2x::Shell < EventMachine::Connection #EventMachine::Protocols::LineAndTextProtocol
  # == Constants ============================================================
  
  PROMPT = "ec2x% "

  # == Class Methods ========================================================
  
  def self.run(config)
    EventMachine::attach(STDIN, self, config)
  end

  # == Instance Methods =====================================================

  def initialize(config)
    STDOUT.sync = true
    
    super()
    
    puts "Console (ec2x-agent #{Ec2x::Config.version})"

    @config = config
    @delegator = Ec2x::CommandDelegator.new(@config)
  end
  
  def notify_readable
    data_received(STDIN.readline)
  rescue EOFError
    quit
  end
  
  def post_init
    prompt
  end
  
  def prompt
    print PROMPT
  end

  def data_received(data)
    line = data.gsub(/^\s+/, '').gsub(/\s+$/, '')
    
    case (line)
    when ''
      # Ignore
    when nil,'quit', '\\q'
      return quit
    else
      # FIX: Naive token splitting needs improvement
      @delegator.interpret(*line.split(/\s+/))
    end
    
    prompt
  end
  
  def quit
    EventMachine::stop_event_loop
  end
end
