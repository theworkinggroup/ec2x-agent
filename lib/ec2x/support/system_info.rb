class Ec2x::Support::SystemInfo
  def initialize(config)
    @config = config
  end
  
  def platform
    IO.popen("#{@config[:uname_path]} -s") do |fh|
      fh.gets.chomp.downcase.to_sym
    end
  end
  
  def linux?
    self.platform == :linux
  end

  def darwin?
    self.platform == :darwin
  end
  
  def ip_address
    ifconfig_details.inject([ ]) do |ips, line|
      line.scan(/inet (?:addr:)?(\d+\.\d+\.\d+\.\d+)/).each do |m|
        ips << m[0] unless (m[0] == '127.0.0.1')
      end
      
      ips
    end.first
  end
  
  def mac_address
    ifconfig_details.inject([ ]) do |mac_addrs, line|
      line.scan(/(?:HWaddr|ether) ((?:[a-fA-F0-9]{2}:){5}[a-fA-F0-9]{2})/).each do |m|
        mac_addrs << m[0]
      end
      
      mac_addrs
    end.first
  end
  
protected
  def ifconfig_details
    @ifconfig_details ||= IO.popen("#{@config[:ifconfig_path]}").readlines
  end
end
