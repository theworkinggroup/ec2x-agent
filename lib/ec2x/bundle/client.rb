class Ec2x::Bundle::Client < Ec2x::Bundle
  # == Constants ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
  
  declare_command :system_info
  def system_info
    system_info = Ec2x::Support::SystemInfo.new(@config)
    
    [
      [ 'ip_address', system_info.ip_address ],
      [ 'mac_address', system_info.mac_address ]
    ]
  end

  declare_command :connection_status
  
  def connection_status
    [
      [ 'connection_status', 'unknown' ]
    ]
  end
end
