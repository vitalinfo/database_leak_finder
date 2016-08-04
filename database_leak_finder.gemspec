# -*- encoding: utf-8 -*-
require File.expand_path('../lib/database_leak_finder/version', __FILE__)

Gem::Specification.new do |s|
  s.name			  = 'database_leak_finder'
  s.version		  = DatabaseLeakFinder::VERSION
  s.date			  = Time.new.strftime('%Y-%m-%d')
  s.summary		  = 'Find database leaks'
  s.description	= "'Easy way to find spec which doesn't clear database after execution"
  s.authors		  = ['vitalinfo']
  s.email			  = 'vital.ryabchinskiy@gmail.com'
  s.files			  = Dir['lib/**/*'] + ['README.md']
  s.homepage    = 'https://github.com/vitalinfo/database_leak_finder'
  s.license     = 'MIT'

  s.add_development_dependency 'bundler', '~> 1.10'
  s.add_development_dependency 'rake', '~> 10.0'

  s.add_runtime_dependency 'activerecord', '>= 3.0.0'
  s.add_runtime_dependency 'rspec'
  s.add_runtime_dependency 'highline'
end