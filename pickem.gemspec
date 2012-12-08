# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "pickem/version"

Gem::Specification.new do |s|
  s.name        = "pickem"
  s.version     = Pickem::VERSION
  s.authors     = ["Chad Jolly"]
  s.email       = ["chad.a.jolly@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Weekly NFL Pickem Suggetions}
  s.description = %q{Weekly NFL Pickem suggestion based on aggregated odds from around the web}

  s.rubyforge_project = "pickem"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock", "~> 1.8.0"

  s.add_runtime_dependency "nokogiri"
  s.add_runtime_dependency "terminal-table"
end
