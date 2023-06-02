require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AplikasiKpi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.time_zone = 'Jakarta'
    config.active_record.default_timezone = :local

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.action_mailer.smtp_settings = {
    address: "",
    port: 465,
    domain: "",
    authentication: :plain,
    enable_starttls_auto: true,
    user_name: "",
    password: "",
    openssl_verify_mode: "none",
    ssl: true,
    tls: true
  }
  end
end
