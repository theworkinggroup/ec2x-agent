class Ec2x::Bundle
  # == Constants ============================================================
  
  # == Class Globals ========================================================
  
  # == Class Methods ========================================================
  
  def self.inherited(subclass)
    # ...
  end
  
  def self.commands
    @@commands ||= { }
  end

  def self.command_list
    self.commands.keys.sort
  end
  
  def self.declare_command(command, definition = { })
    commands[command.to_s.split(/_/).join(' ')] = {
      :delegate_class => self,
      :delegate_method => command,
      :required => definition[:required],
      :options => definition[:options]
    }
  end

  # == Instance Methods =====================================================
  
  def initialize(config)
    @config = config
  end
end
