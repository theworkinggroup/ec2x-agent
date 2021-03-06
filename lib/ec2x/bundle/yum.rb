class Ec2x::Bundle::Yum < Ec2x::Bundle
  # == Constants ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
  
  declare_command :install_package,
    :required => %w[ name ],
    :options => %w[ version ]

  def install_package(name, options = { })
    {
      :install_package => call_package_manager('install', name, *flags)
    }
  end

protected
  def call_package_manager(*args)
    command = [ @config[:yum_path] ] + args
    result = system(command)
    
    {
      :command => command,
      :result => result
    }
  end
end
