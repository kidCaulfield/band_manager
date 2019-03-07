require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BandManager
  class Application < Rails::Application
  
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore, key: '_coookie_name', expire_after: 30.days
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.active_job.queue_adapter = :delayed_job

    config.middleware.insert_before(0, Rack::Cors) do
      allow do
        # origins "www.google.com"
        origins "localhost:3030", "127.0.0.1:3030", "band-manager1.herokuapp.com"
        # "origins" specifies which domains are allowed to make AJAX
        # requests to this server. "*" means everyone and should normally not
        # by used.
        resource(
          "/v1/*", # this means that only routes that begin with /api/ are accessible
          headers: :any,
          credentials: true,
          methods: [:get, :post, :delete, :patch, :put, :options]
        )
      end
    end
  end
end
