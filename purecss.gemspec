# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'purecss/version'

Gem::Specification.new do |spec|
  spec.name          = "purecss"
  spec.version       = Purecss::VERSION
  spec.authors       = ["mseri"]
  spec.email         = ["marcello.seri@gmail.com"]
  spec.description   = %q{Pure CSS (purecss.io) for Rails 3.1 Asset Pipeline}
  spec.summary       = %q{Pure (purecss.io) is a set of small, responsive CSS modules that you can use in every web project realized by the yahoo developer team.}
  spec.homepage      = "https://github.com/mseri/rails-purecss"

  spec.files = Dir["{app,lib,vendor}/**/*"] + ["README.md"]
  #spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
