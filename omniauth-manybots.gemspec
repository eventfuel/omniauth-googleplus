# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-googleplus/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-googleplus"
  s.version     = Omniauth::Manybots::VERSION
  s.authors     = ["Niko Roberts"]
  s.email       = ["niko@tasboa.com"]
  s.homepage    = "https://github.com/tasboa/omniauth-googleplus"
  s.summary     = %q{OmniAuth strategy for Google Plus}
  s.description = %q{OmniAuth strategy for Google Plus}

  s.rubyforge_project = "omniauth-googleplus"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'omniauth-oauth', '~> 1.0'
  s.add_development_dependency 'rspec', '~> 2.7'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'webmock'  
end
