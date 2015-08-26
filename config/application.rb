require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Lecture
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.paths << Rails.root.join('vendor', 'assets', 'components')

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Seoul'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.available_locales = [:ko]
    config.i18n.fallbacks = true
    I18n.config.enforce_available_locales = false
    config.i18n.default_locale = :ko

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Use redis to manage cache
    config.cache_store = :redis_store, 'redis://localhost:6379/0/cache', {expires_in: 90.minutes}

    # To render erroneous pages
    # http://wearestac.com/blog/dynamic-error-pages-in-rails
    config.exceptions_app = self.routes
  end
end
