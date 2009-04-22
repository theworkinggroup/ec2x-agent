class Ec2x::CommandDelegator
  # == Constants ============================================================

  # == Class Methods ========================================================
  
  # == Instance Methods =====================================================
  
  def initialize(config)
    @config = config
    @bundle = { }
  end
  
  def interpret(*args)
    command = args.shift
    
    loop do
      if (delegate_options = Ec2x::Bundle.commands[command])
        return delegate(delegate_options, args)
      end
      
      if (args.empty?)
        puts "Invalid command: #{command}"
        return
      end
      
      command << ' '
      command << args.shift
    end
  end
  
  def delegator_for(delegate_options)
    @bundle[delegate_options[:delegate_class]] ||= delegate_options[:delegate_class].new
  end
  
  def delegate(delegate_options, args)
    delegate_to = delegator_for(delegate_options)
    
    delegate_to.send(delegate_options[:delegate_method], *args)
  end
end
