module Ec2x
  autoload(:Client, 'ec2x/client')
  autoload(:Config, 'ec2x/config')
  autoload(:CommandDelegator, 'ec2x/command_delegator')
  autoload(:Exception, 'ec2x/exception')
  autoload(:Logger, 'ec2x/logger')
  autoload(:Shell, 'ec2x/shell')
  
  def symbolize_keys(hash)
    hash.inject({ }) do |h, (k, v)|
      case (v)
      when Hash
        h[k.to_sym] = symbolize_keys(v)
      else
        h[k.to_sym] = v
      end
      h
    end
  end
end
