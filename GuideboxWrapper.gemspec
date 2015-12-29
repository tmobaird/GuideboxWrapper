# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'GuideboxWrapper/version'

Gem::Specification.new do |spec|
  spec.name          = "GuideboxWrapper"
  spec.version       = GuideboxWrapper::VERSION
  spec.authors       = ["Thomas Baird"]
  spec.email         = ["tbaird@mail.umw.edu"]

  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  # end

  spec.summary       = %q{A ruby wrapper for the Guidebox API.}
  spec.description   = %q{This gem is a ruby wrapper for the Guidebox API. Guidebox is a big database of movie/tv-show information. This gem allows you to query this api easily for different pieces of data.}
  spec.homepage      = "https://github.com/tmobaird/GuideboxWrapper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "json", "~> 1.8"

end
