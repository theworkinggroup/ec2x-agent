class Ec2x::Logger
  # == Constants ============================================================

  DATE_FORMAT = '%Y-%m-%d %H:%M:%S %z'
  LOG_FORMAT = '[%s] %s'

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
  
  def initialize(config)
    @config = config
    
    @log = !@config[:interactive] && STDOUT
  end
  
  def log(level, message)
    @log and @log.puts(LOG_FORMAT % [ Time.now.strftime(DATE_FORMAT), message ])
  end
end
