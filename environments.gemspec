# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'environments/version'

Gem::Specification.new do |spec|
  spec.name          = "environments"
  spec.version       = Environments::VERSION
  spec.authors       = ["Caio Torres"]
  spec.email         = ["caio.a.torres@gmail.com"]
  spec.summary       = %q{A simple gem to help you check the environment your application is running}
  spec.description   = %q{A simple gem which gives you a lot of tools to check and set the current environment of your application}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "pry-meta"
end
