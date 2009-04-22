class Ec2x::Bundle::Client < Ec2x::Bundle
  # == Constants ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

  declare_command :connection_status
  
  def connection_status
    puts "Conection status:"
    puts "\tUnknown."
  end
end
