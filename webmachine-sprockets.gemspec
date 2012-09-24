# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'webmachine/sprockets/version'

Gem::Specification.new do |s|
  s.name        = 'webmachine-sprockets'
  s.version     = Webmachine::Sprockets::VERSION
  s.date        = Date.today.to_s
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Lars Gierth']
  s.email       = ['lars.gierth@gmail.com']
  s.homepage    = 'https://github.com/lgierth/webmachine-sprockets'
  s.summary     = %q{Webmachine for Ruby: Sprockets integration}
  s.description = s.summary

  s.add_dependency 'webmachine', '~> 1.0'
  s.add_dependency 'sprockets',  '~> 2.0'
  
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rack'

  s.files         = `git ls-files`.split("\n") - ['.gitignore', '.travis.yml']
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ['lib']
end
