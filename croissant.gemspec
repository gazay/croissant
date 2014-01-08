$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "croissant/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "croissant"
  s.version     = Croissant::VERSION
  s.authors     = ["gazay"]
  s.email       = ["alex.gaziev@gmail.com"]
  s.homepage    = "http://github.com/gazay/croissant"
  s.summary     = "ascii renderer"
  s.description = "later"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails" #, "~> 4.1.0.beta1"
  s.add_dependency "imgkit"
  s.add_dependency "asciiart"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "byebug"
end
