class Ec2x::Bundle::Help < Ec2x::Bundle
  # == Constants ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
  
  declare_command :help

  def help(*args)
    if (args.empty?)
      puts "Available Commands:"
      
      command_list.each do |cmd|
        puts "* #{cmd}"
      end
    else
      command = args.join(' ')
      
      if (command_params = Ec2x::Bundle.commands[command])
        print "Usage: #{command}"
        
        if (command_params[:required])
          command_params[:required].each do |arg|
            print " #{arg.upcase}"
          end
        end
        
        print "\n"
      else
        puts "Unknown command: #{command}"
      end
    end
  end
  
protected
  def command_list
    Ec2x::Bundle.command_list
  end
end
