$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "session_store_migrator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "session_store_migrator"
  s.version     = SessionStoreMigrator::VERSION
  s.authors     = ["moro"]
  s.email       = ["kyosuke-morohashi@cookpad.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of SessionStoreMigrator."
  s.description = "TODO: Description of SessionStoreMigrator."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"
end
