# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pergo/version'

Gem::Specification.new do |spec|
  spec.name          = "pergo"
  spec.version       = Pergo::VERSION
  spec.authors       = ["MalcyL, mmmmmrob", "iHiD"]
  spec.email         = ["malcolm@landonsonline.me.uk, rob@dynamicorange.com", "jeremy@meducation.net"]
  spec.description   = %q{A simple wrapper of Propono.}
  spec.summary       = %q{See also Propono, a pub/sub build on AWS.}
  spec.homepage      = ""
  spec.license       = "AGPL3"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "propono"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "minitest", "~> 5.0.8"
end
