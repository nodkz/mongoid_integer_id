# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongoid_integer_id/version'

Gem::Specification.new do |spec|
  spec.name          = "mongoid_integer_id"
  spec.version       = MongoidIntegerId::VERSION
  spec.authors       = ["Semenyuk Dmitriy", "Ilya Konanykhin"]
  spec.email         = ["mail@semenyukdmitriy.com"]
  spec.description   = %q{Gives ability to use simple integer ID for Mongoid models (for example, for IDs used in URLs)}
  spec.summary       = %q{Gives ability to use simple integer ID for Mongoid models (for example, for IDs used in URLs)}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "mongoid"
end
