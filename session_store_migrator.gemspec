$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "session_store_relocator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "session_store_relocator"
  s.version     = SessionStoreRelocator::VERSION
  s.authors     = ["moro"]
  s.email       = ["kyosuke-morohashi@cookpad.com"]
  s.summary     = "Relocate sesion store from cookie to redis, write session data both strage"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.22"
  s.add_dependency "redis-session-store"

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'pry-byebug'
  s.add_development_dependency 'tapp'
  s.add_development_dependency 'mock_redis'
end
