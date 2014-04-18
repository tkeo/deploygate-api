# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deploygate/api/version'

Gem::Specification.new do |spec|
  spec.name          = "deploygate-api"
  spec.version       = Deploygate::Api::VERSION
  spec.authors       = ["Takeo Fujita"]
  spec.email         = ["takeofujita@gmail.com"]
  spec.summary       = %q{Ruby client for deploygate API}
  spec.description   = %q{Ruby client for deploygate API}
  spec.homepage      = "https://github.com/tkeo/deploygate-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faraday"
  spec.add_runtime_dependency "faraday_middleware"
  spec.add_runtime_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
