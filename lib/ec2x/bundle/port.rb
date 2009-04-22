class Ec2x::Bundle::Port < Ec2x::Bundle
  # == Constants ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
  
  declare_command :install_package,
    :required => %w[ name ],
    :options => %w[ version flags ]

  def install_package(name, options = { })
    {
      :install_package => call_package_manager('install', name)
    }
  end

protected
  def call_package_manager(*args)
    # FIX: Calling a system command may throw an exception so trap here
    
    command = [ @config[:yum_path] ] + args
    result = system(command)
    
    {
      :command => command,
      :result => result
    }
  end
end
