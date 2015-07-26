# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'strapify/version'

Gem::Specification.new do |spec|
  spec.name          = "strapify"
  spec.version       = Strapify::VERSION
  spec.authors       = ["Freddy Rangel"]
  spec.email         = ["frederick.rangel@gmail.com"]
  spec.summary       = %q{
    Easily bootstrap any kind of application based on prototypes.
  }
  spec.description   = %q{
    Easily bootstrap any kind of application based on prototypes.
  }
  spec.homepage      = "https://github.com/freddyrangel/strapify"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.
    split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '~> 3.3', '>= 3.3.0'
  spec.add_development_dependency 'webmock', '~> 1.21', '>= 1.21.0'
  spec.add_development_dependency 'godot', '~> 0.3.0'
  spec.add_development_dependency 'sinatra', '~> 1.4.6'
end
