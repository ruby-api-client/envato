# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "envato/version"

Gem::Specification.new do |s|
  s.name          = "envato"
  s.version       = Envato::VERSION
  s.summary       = "WIP - Envato API client"
  s.description   = "WIP - Envato API wrapper written in Ruby"
  s.authors       = ["Ilya Brin"]
  s.email         = "ilya@codeplay.ru"
  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) {|f| File.basename(f) }
  s.require_paths = ["lib"]
  s.homepage      = "https://github.com/ruby-api-client/envato"
  s.license       = "MIT"

  s.required_ruby_version = ">= 2.6"

  s.metadata["rubygems_mfa_required"] = "true"

  s.add_dependency "addressable", "~> 2.3", ">= 2.3.7"
  s.add_dependency "faraday", "~> 1.7"

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake", ">= 10"
  s.add_development_dependency "rspec", ">= 3.0"
  s.add_development_dependency "simplecov", ">= 0.9"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock"
end
