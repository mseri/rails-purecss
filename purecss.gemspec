# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'purecss/version'

Gem::Specification.new do |spec|
  spec.name          = "purecss"
  spec.version       = Purecss::VERSION
  spec.authors       = ["mseri"]
  spec.email         = ["marcello.seri@gmail.com"]
  spec.description   = %q{Pure CSS (purecss.io) toolkit for Rails Asset Pipeline}
  spec.summary       = %q{purecss gem integrates the Pure CSS (purecss.io) toolkit to the Rails Asset Pipeline.}
  spec.homepage      = "https://github.com/mseri/rails-purecss"

  spec.files = Dir["{app,lib,vendor}/**/*"] + ["README.md"]
  #spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rails', '>= 3.1'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
