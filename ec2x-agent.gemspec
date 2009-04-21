# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ec2x-agent}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["theworkinggroup", "tadman"]
  s.date = %q{2009-04-21}
  s.email = %q{github@twg.ca}
  s.executables = ["console", "ec2x"]
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "bin/console",
    "bin/ec2x",
    "lib/ec2x.rb",
    "lib/ec2x/agent.rb",
    "lib/ec2x/bundle.rb",
    "lib/ec2x/bundle/apache.rb",
    "lib/ec2x/bundle/ebs.rb",
    "lib/ec2x/bundle/gem.rb",
    "lib/ec2x/bundle/git.rb",
    "lib/ec2x/bundle/mysqld.rb",
    "lib/ec2x/bundle/yum.rb",
    "lib/ec2x/command_delegator.rb",
    "lib/ec2x/config.rb",
    "lib/ec2x/exception.rb",
    "lib/ec2x/shell.rb",
    "lib/ec2x_agent.rb",
    "test/ec2x_agent_test.rb",
    "test/test_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/theworkinggroup/ec2x-agent}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{EC2x Agent Library}
  s.test_files = [
    "test/ec2x_agent_test.rb",
    "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
