# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'japanese/train/access/version'

Gem::Specification.new do |spec|
  spec.name          = "japanese-train-access"
  spec.version       = Japanese::Train::Access::VERSION
  spec.authors       = ["haneru"]
  spec.email         = ["haneru3@gmail.com"]

  spec.summary       = %q{Root seach.}
  spec.description   = %q{You can seach japanese train roots.}
  spec.homepage      = "https://github.com/haneru/japanese-train-access"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "nokogiri"
  spec.add_development_dependency "pry"
  spec.add_dependency 'thor'
end
