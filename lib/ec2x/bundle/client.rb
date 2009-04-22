class Ec2x::Bundle::Client < Ec2x::Bundle
  # == Constants ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
  
  declare_command :system_info
  def system_info
    system_info = Ec2x::Support::SystemInfo.new(@config)
    
    puts "IP Address: #{system_info.ip_address}"
    puts "MAC Address: #{system_info.mac_address}"
  end

  declare_command :connection_status
  
  def connection_status
    puts "Conection status:"
    puts "\tUnknown."
  end
end
