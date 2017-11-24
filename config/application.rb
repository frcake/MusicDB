require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MusicDB
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_view.field_error_proc = proc { |html_tag, _instance|
      "<span class='field_with_errors'>#{html_tag}<span class='glyphicon glyphicon-exclamation-sign'></span></span>".html_safe
    }
    config.assets.precompile += %w[tinymce/tiny_mce.js tinymce/langs/en.js tinymce/themes/advanced/editor_template.js]
    config.assets.initialize_on_precompile = false
  end
end
