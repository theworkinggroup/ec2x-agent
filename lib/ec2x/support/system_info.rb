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
end
