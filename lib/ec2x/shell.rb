class Ec2x::Shell
  # == Constants ============================================================

  # == Class Methods ========================================================
  
  def self.run(options = { })
    new(options).run
  end
  

  # == Instance Methods =====================================================

  def initialize(options = { })
    puts "Console (ec2x-agent #{Ec2x::Config.version})"

    @options = options
    @options[:interactive] = true
    @options[:verbose] = true
    @config = @options[:config] ||= Ec2x::Config.new(@options)
    
    @agent = @options[:agent] ||= Ec2x::Agent.new(@options)
    
    @agent.connect

    @delegator = Ec2x::CommandDelegator.new(@options)
  end
  
  def run
    STDOUT.sync = true
    
    begin
      loop do
        print "ec2x% "
        line = STDIN.readline
        
        line = line.gsub(/^\s+/, '').gsub(/\s+$/, '')
        
        case (line)
        when ''
          # Ignore
        when nil,'quit', '\\q'
          quit
        else
          # FIX: Naive token splitting needs improvement
          @delegator.interpret(line)
        end
      end
    rescue EOFError, Interrupt
      quit
    end
  end
  
  def quit
    puts "\nQuit."
    exit(0)
  end
end
