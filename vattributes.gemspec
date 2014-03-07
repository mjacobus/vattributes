$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "vattributes/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "vattributes"
  s.version     = Vattributes::VERSION
  s.authors     = ["Marcelo Jacobus"]
  s.email       = ["marcelo.jacobus@gmail.com"]
  s.description = %q{Create virtual attributes for active record. Uses serialization}
  s.summary     = %q{Create virtual attributes for active record}
  s.homepage    = "https://github.com/mjacobus/vattributes"
  s.license     = "MIT"

  s.files       = `git ls-files`.split($/)
  s.test_files  = s.files.grep(%r{^(test|spec|features)/})

  s.add_dependency "rails", ">= 3.0", "<= 5.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "coveralls"
end

