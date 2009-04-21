class Ec2x::Bundle::Yum < Ec2x::Bundle
  # == Constants ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
  
  declare_command :install_package,
    :required => %w[ name ],
    :options => %w[ version ]

  def install_package(name)
    call_yum('install', name, '-y')
  end

protected
  def call_yum(*args)
    system(Ec2x::Options.yum_path, *args)
  end
end
