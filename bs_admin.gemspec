$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bs_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bs_admin"
  s.version     = BsAdmin::VERSION
  s.authors     = ["Leo Uzon"]
  s.email       = ["leo.uz86@gmail.com"]
  s.homepage    = ""
  s.summary     = "BsAdmin is customizable high-level admin interface for rails"
  s.description = s.summary

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  # core =====================================================
  s.add_dependency "rails"

  # # model helpers ============================================
  # s.add_dependency "kaminari"

  # # populate =================================================
  # s.add_dependency "faker"
  # s.add_dependency "populator"

  # # assets processors ========================================
  # s.add_dependency "compass"
  # s.add_dependency "compass-rails"
  # s.add_dependency "coffee-rails", "~> 3.2.1"
  # s.add_dependency "slim"
  # s.add_dependency "slim-rails"

  # # assets libraries =========================================
  # s.add_dependency "jquery-rails"
  # s.add_dependency 'underscore-rails'
  # s.add_dependency 'jquery-fileupload-rails'
  # s.add_dependency 'bootstrap-sass', '~> 3.1.1'
  # s.add_dependency 'autoprefixer-rails'
  # s.add_dependency 'font-awesome-sass'
  # s.add_dependency 'bootstrap-wysihtml5-rails'
  # s.add_dependency 'summernote-rails'

  # # image processing =========================================
  # s.add_dependency 'rmagick'
  # s.add_dependency 'carrierwave'


  s.add_development_dependency "sqlite3"
  s.add_development_dependency "debugger"
  s.add_development_dependency "bower-rails"
end