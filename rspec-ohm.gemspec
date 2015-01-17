# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/ohm/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-ohm"
  spec.version       = Rspec::Ohm::VERSION
  spec.authors       = ["jc00ke"]
  spec.email         = ["jesse@jc00ke.com"]
  spec.summary       = %q{RSpec matchers for Ohm}
  spec.description   = %q{RSpec matchers for Ohm}
  spec.homepage      = "https://github.com/jc00ke/rspec-ohm"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "bundler", "~> 1.7"
  spec.add_dependency "rake", "~> 10.0"
  spec.add_dependency "rspec", "~> 3.1"
  spec.add_dependency "ohm", "~> 2.0"

  spec.add_development_dependency "pry", "~> 0.10"
end
