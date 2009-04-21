class Ec2x::Shell < EventMachine::Connection #EventMachine::Protocols::LineAndTextProtocol
  # == Constants ============================================================
  
  PROMPT = "ec2x% "

  # == Class Methods ========================================================
  
  def self.run(options = { })
    EventMachine::attach(STDIN, self, options)
  end

  # == Instance Methods =====================================================

  def initialize(sig, options = { })
    STDOUT.sync = true
    
    super(sig)
    
    puts "Console (ec2x-agent #{Ec2x::Config.version})"

    @options = options
    @options[:interactive] = true
    @options[:verbose] = true
    @config = @options[:config] ||= Ec2x::Config.new(@options)
    
    @agent = @options[:agent] ||= Ec2x::Agent.new(@options)
    @agent.connect

    @delegator = Ec2x::CommandDelegator.new(@options)
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
      @delegator.interpret(line)
    end
    
    prompt
  end
  
  def quit
    EventMachine::stop_event_loop
  end
end
