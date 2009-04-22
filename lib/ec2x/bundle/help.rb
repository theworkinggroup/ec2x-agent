class Ec2x::Bundle::Help < Ec2x::Bundle
  # == Constants ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
  
  declare_command :help

  def help(*args)
    if (args.empty?)
      {
        :commands => command_list
      }
    else
      command = args.join(' ')
      
      if (command_params = Ec2x::Bundle.commands[command])
        result =
          {
            :usage => command
          }
        
        if (command_params[:required])
          command_params[:required].each do |arg|
            result[:usage] << " #{arg.upcase}"
          end
        end
        
        result
      else
        {
          :unknown_command => command
        }
      end
    end
  end
  
protected
  def command_list
    Ec2x::Bundle.command_list
  end
end
