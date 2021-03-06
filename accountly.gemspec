$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "lobby/version"
require "accountly/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "accountly"
  s.version     = Accountly::VERSION
  s.authors     = ["Guido Boyke"]
  s.email       = ["guido.boyke@gboyke.com"]
  s.homepage    = "http://www.gboyke.com"
  s.summary     = "Account Administration"
  s.description = "Lightweight administration on top of lobby-gem"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "haml", "~> 4.0.4"
  s.add_dependency "lobby", "~> 0.0.6"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "debugger"
  s.add_development_dependency "rspec-rails", "~> 2.14.0"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "database_cleaner", '1.0.0.RC1'
  s.add_development_dependency "spork-rails"
  s.add_development_dependency "guard-spork"
  s.add_development_dependency "shoulda-matchers"

  s.require_paths = ["lib"]
end
