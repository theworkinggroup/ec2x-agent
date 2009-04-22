class Ec2x::Config
  # == Constants ============================================================
  
  DEFAULT_CONFIG_FILES = [
    "#{ENV['HOME']}/.ec2x/config"
  ]

  DEFAULTS = {
    :remote_url => 'ec2x://localhost',
    :remote_port => 9116,
    :yum_path => '/usr/bin/yum',
    :uname_path => '/usr/bin/uname',
    :ifconfig_path => '/sbin/ifconfig',
    :df_path => '/bin/df',
    :mount_path => '/bin/mount'
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
  
  def initialize(options = nil)
    @config = DEFAULTS.merge(options || { })
    
    merge_config_options
    assign_extracted_host_port
  end
  
  def config_file_path
    load_paths = DEFAULT_CONFIG_FILES
    config_file_specified = @config[:config_file]
    
    if (config_file_specified)
      unless (File.exist?(config_file_specified))
        raise Ec2x::Exception, "Could not locate config file #{config_file_specified}"
      end
      
      load_paths = [ config_file_specified ]
    end
  
    load_paths.find do |path|
      File.exist?(path)
    end
  end
  
  def merge_config_options
    if (config_found = self.config_file_path)
      if (config = YAML.load(open(config_found)))
        config = Ec2x::symbolize_keys(config)
        
        @config = config.merge(@config)
        puts "* Loaded configuration from #{config_found}" if (verbose?)
      else
        puts "* Configuration file is in unknown format." if (verbose?)
      end
    else
      puts "* No configuration file found. Using defaults." if (verbose?)
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
  
  def interactive?
    @config[:interactive]
  end

  def verbose?
    @config[:verbose]
  end
  
  def logger
    @config[:logger] ||= Ec2x::Logger.new(self)
  end

  def logger=(value)
    @config[:logger] = value
  end

  def client
    @config[:client]
  end

  def client=(value)
    @config[:client] = value
  end

protected
  def assign_extracted_host_port
    if (!@config[:remote_url] or @config[:remote_url].empty?)
      raise Ex2x::Exception, "Configuration parameter 'remote_url' cannot be blank."
    else
      begin
        if (uri = URI.parse(@config[:remote_url]))
          @config[:remote_host] = uri.host
          @config[:remote_port] = uri.port if (uri.port)
        end
      rescue URI::InvalidURIError
        raise Ec2x::Exception, "Configuration parameter 'remote_url' is not in correct format: #{@config[:remote_url]}"
      end
    end
  end
end
