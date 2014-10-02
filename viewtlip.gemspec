# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'viewtlip/version'

Gem::Specification.new do |spec|
  spec.name          = "viewtlip"
  spec.version       = Viewtlip::VERSION
  spec.authors       = ["YOSHIDA Hiroki"]
  spec.email         = ["hyoshida@appirits.com"]
  spec.summary       = %q{Provide feature to search view files from your browser.}
  spec.description   = %q{Provide feature to search view files from your browser.}
  spec.homepage      = "https://github.com/hyoshida/viewtlip"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "railties", "~> 4.1.0"
  spec.add_dependency "actionview", "~> 4.1.0"
  spec.add_dependency "nokogiri"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
