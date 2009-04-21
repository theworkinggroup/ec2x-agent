class Ec2x::Config
  # == Constants ============================================================
  
  DEFAULT_CONFIG_FILES = [
    "#{ENV['HOME']}/.ec2x/config"
  ]

  DEFAULTS = {
    :master_url => 'ec2x://localhost',
    :default_port => 9116
  }

  # == Class Methods ========================================================
  
  def self.version
    begin
      version_info = YAML.load(open(File.join(File.dirname(__FILE__), '..', '..', 'VERSION.yml')))
      
      version_info and [ version_info[:major], version_info[:minor], version_info[:patch] ] * '.' or 'undefined'
    rescue Errno::ENOENT
      'undefined'
    end
  end
  
  # == Instance Methods =====================================================
  
  def initialize(options = { })
    # TODO
    @options = options
    @config = { }
    
    read_config(@options[:config_file])
  end
  
  def read_config(config_file)
    load_paths = DEFAULT_CONFIG_FILES
    
    if (config_file)
      unless (File.exist?(config_file))
        raise Ec2x::Exception, "Could not locate config file #{config_file}"
      end
      
      load_paths = [ config_file ]
    end
  
    config_found =
      load_paths.find do |path|
        File.exist?(path)
      end
    
    if (config_found)
      @config = YAML.load(open(config_found))
      puts "* Loaded configuration from #{config_found}" if (@options[:verbose])
    else
      puts "* No configuration file found. Using defaults." if (@options[:verbose])
    end
  end
  
  def [](key)
    key = key.to_sym
    
    @config.has_key?(key) ? @config[key] : DEFAULTS[key]
  end

  def []=(key, value)
    @config[key.to_sym] = value
  end
  
  def inspect
    @config.inspect
  end
end
