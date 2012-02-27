# Load application spectific settings from config.yml
raw_config = File.read(RAILS_ROOT + "/config/config.yml")
APP_CONFIG = YAML.load(raw_config)[RAILS_ENV]

#Set defaults for action mailer
Sfxmw::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb 
  # and config/environments.rb
  
  config.action_mailer.raise_delivery_errors = true
  
  config.action_mailer.smtp_settings = {
    :address              => APP_CONFIG[:email_config][:address],
    :port                 => APP_CONFIG[:email_config][:port],
    :domain               => APP_CONFIG[:email_config][:email_domain],
    :user_name            => APP_CONFIG[:email_config][:user_name],
    :password             => APP_CONFIG[:email_config][:password],
    :authentication       => APP_CONFIG[:email_config][:authentication],
    :enable_starttls_auto => false
  }
  
  config.action_mailer.default_url_options = {
    :host => APP_CONFIG[:email_config][:host]
  }
  
end