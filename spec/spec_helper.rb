ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../dummy/config/environment", __FILE__)

require 'rspec/rails'
require 'debugger'
require 'json-schema'

# capybara
# require 'capybara/rspec'
# require 'capybara/webkit'
# require 'capybara/poltergeist'
# require 'support/wait_for_ajax'
# require 'formulaic'
# Capybara.javascript_driver = :poltergeist
# Capybara.javascript_driver = :webkit
# Capybara.default_max_wait_time = 5

app_base_path = Gem.loaded_specs['app_base'].full_gem_path
Dir["#{app_base_path}/lib/support/matchers/**/*.rb"].sort.each { |f| require f }
Dir["#{app_base_path}/lib/support/examples/**/*.rb"].sort.each { |f| require f }

require 'support/test_helper'
require 'bs_admin/faker_wrapper'


RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
  # config.include FactoryGirl::Syntax::Methods  
  config.include BsAdmin::FakerWrapper
  config.include TestHelper
  # config.include Capybara::DSL, type: :feature
  # config.include Formulaic::Dsl, type: :feature
  # config.include WaitForAjax, type: :feature
  # config.include Sorcery::TestHelpers::Rails::Controller
  # config.include Sorcery::TestHelpers::Rails::Integration

  # config.include FactoryGirl::Syntax::Methods
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  config.order = :defined

  config.before(:all) do    
    clear_database
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries.clear
  end
  
  config.use_transactional_fixtures = false

  config.after :each do
    ActionMailer::Base.deliveries.clear    
  end

# The settings below are suggested to provide a good initial experience
# with RSpec, but feel free to customize to your heart's content.

  # These two settings work together to allow you to limit a spec run
  # to individual examples or groups you care about by tagging them with
  # `:focus` metadata. When nothing is tagged with `:focus`, all examples
  # get run.
  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended. For more details, see:
  #   - http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax
  #   - http://teaisaweso.me/blog/2013/05/27/rspecs-new-message-expectation-syntax/
  #   - http://myronmars.to/n/dev-blog/2014/05/notable-changes-in-rspec-3#new__config_option_to_disable_rspeccore_monkey_patching
  config.disable_monkey_patching!

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output,
    # unless a formatter has already been configured
    # (e.g. via a command-line flag).
    config.default_formatter = 'doc'
  end

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option.
  # Setting this allows you to use `--seed` to deterministically reproduce
  # test failures related to randomization by passing the same `--seed` value
  # as the one that triggered the failure.
  Kernel.srand config.seed

end

# MandrillDm.configure do |config|
#   config.api_key = ENV['MANDRILL_APIKEY']
# end

# Capybara::Webkit.configure do |config|
#   # Enable debug mode. Prints a log of everything the driver is doing.
#   config.debug = true

#   # By default, requests to outside domains (anything besides localhost) will
#   # result in a warning. Several methods allow you to change this behavior.

#   # Silently return an empty 200 response for any requests to unknown URLs.
#   config.block_unknown_urls

#   # Allow pages to make requests to any URL without issuing a warning.
#   config.allow_unknown_urls

#   # Allow a specifc domain without issuing a warning.
#   config.allow_url("example.com")

#   # Allow a specifc URL and path without issuing a warning.
#   config.allow_url("example.com/some/path")

#   # Wildcards are allowed in URL expressions.
#   config.allow_url("*.example.com")

#   # Silently return an empty 200 response for any requests to the given URL.
#   config.block_url("example.com")

#   # Timeout if requests take longer than 5 seconds
#   config.timeout = 5

#   # Don't raise errors when SSL certificates can't be validated
#   config.ignore_ssl_errors

#   # Don't load images
#   config.skip_image_loading

#   # Use a proxy
#   config.use_proxy(
#     host: "example.com",
#     port: 1234,
#     user: "proxy",
#     pass: "secret"
#   )
# end

