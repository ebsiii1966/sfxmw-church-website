class Form < ActiveRecord::Base
  has_attached_file :form
  validates :name, :presence => true
  #default_scope :order => :created_at
  
  scope :future, where('post_at > ?', Time.now)
  scope :expired, where('expire_at < ?', Time.now)
  scope :current, where('post_at < ? and expire_at > ?', Time.now, Time.now)
  
  belongs_to :user, :foreign_key => "created_by"
  belongs_to :user, :foreign_key => "updated_by"
  belongs_to :user, :foreign_key => "approved_by"
end
