# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rml/version"

Gem::Specification.new do |s|
  s.name        = "rml"
  s.version     = RML::VERSION
  s.authors     = ["Omar Rodriguez", "Rafael George"]
  s.email       = ["omarjavier15@gmail.com", "george.rafael@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Ruby markup language}
  s.description = %q{RML: Is a DSL for generating HTML from Ruby code}

  s.rubyforge_project = "rml"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_runtime_dependency "rest-client"
end
