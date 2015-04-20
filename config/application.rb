require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TrmzInterviewRails
  class Application < Rails::Application
    config.time_zone = "Europe/Berlin"
    config.autoload_paths += Dir[Rails.root.join('app', 'services', '**').to_s]
    config.active_record.raise_in_transactional_callbacks = true
    config.active_job.queue_adapter = :delayed_job
  end
end
