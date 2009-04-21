class Ec2x::CommandDelegator
  # == Constants ============================================================

  # == Class Methods ========================================================
  
  # == Instance Methods =====================================================
  
  def initialize(options)
    @config = options[:config] || Ec2x::Config.new(options)
  end
  
  def interpret(*args)
  end
  
  def delegate(name, args, options = { })
    puts "#{name} #{args}"
  end
  
  def declare(name, delegate_class, delegate_method, options = { })
  end
end
