# Dependencies

require 'yaml'
require 'uri'
require 'socket'

# Base Class

require 'ec2x'

# Load System-Specific Modules

require 'ec2x/bundle'
require 'ec2x/bundle/apache'
require 'ec2x/bundle/client'
require 'ec2x/bundle/ebs'
require 'ec2x/bundle/help'
require 'ec2x/bundle/gem'
require 'ec2x/bundle/git'
require 'ec2x/bundle/mysqld'

# FIX: Make config support command line parameters
# FIX: Make Ec2x::Bundle an instance and not a singleton

case (Ec2x::Support::SystemInfo.new(Ec2x::Config.new).platform)
when :linux
  require 'ec2x/bundle/yum'
when :darwin
  require 'ec2x/bundle/port'
end
