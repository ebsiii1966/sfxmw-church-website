require 'digest/sha2'

class User < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :password, :confirmation => true, :length => {:within => 6..20}, :on => :create
  validates :password, :confirmation => true, :length => {:within => 6..20}, :allow_blank => true, :on => :update
  # validates_format_of :password, :with => /^$|^(?=.*\d)(?=.*([a-z]|[A-Z]))$/
  # password must have a digit
  validates_format_of :password, :with => /^$|^.*.\d.*$/
  
  has_many :news_items, :foreign_key => "created_by"
  has_many :news_items, :foreign_key => "updated_by"
  has_many :news_items, :foreign_key => "approved_by"
  
  attr_accessor :password_confirmation
  attr_reader :password
  validate :password_must_be_present
  
  
  def User.authenticate(name, password)
    if user = find_by_name(name)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end
    
  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "sfxmw" + salt)
  end
    
  # 'password' is a virtual attribute  
  def password=(password)
    @password = password
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end
  
  def show_active
    if active
      'Yes'
    else
      'No'
    end
  end
  
  def show_last_login
    if last_login.nil?
      'Never Logged In'
    else
      last_login.strftime("%B %d, %Y")
    end
  end
  
  def self.super?(rights_string)
    if rights_string.nil?
      false
    else
      rights_string.downcase.include? "super"
    end
  end
  
  def super?
    User.super?(rights)
  end
  
  private
    def password_must_be_present
      errors.add(:password, "Missing Password") unless hashed_password.present?
    end
    
    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end    
end





