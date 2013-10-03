# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ansible-helper/version'

Gem::Specification.new do |spec|
  spec.name          = "ansible-helper"
  spec.version       = AnsibleHelper::VERSION
  spec.authors       = ["Mathieu Martin"]
  spec.email         = ["webmat@gmail.com"]
  spec.description   = %q{A small command line helper that helps automate repetitive
                          tasks when using Ansible.}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/webmat/ansible-helper"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
