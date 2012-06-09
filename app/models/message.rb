class Message

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :contact_method, :name, :email, :subject, :body

  validates :contact_method, :name, :email, :subject, :body, :presence => true
  validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => true
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
  
  def get_to_address
    case @contact_method
    when "Parish Office"
      APP_CONFIG[:email_config][:office_address]
    when "Pastor"
      APP_CONFIG[:email_config][:pastor_address]
    when "News Request"
      APP_CONFIG[:email_config][:news_address]
    else
      APP_CONFIG[:email_config][:webmaster_address]
    end
  end
    
end