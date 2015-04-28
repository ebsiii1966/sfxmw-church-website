class Form < ActiveRecord::Base
  has_attached_file :form
  validates :name, :presence => true
  #default_scope :order => :created_at
  after_initialize :init
    
  scope :future, where('post_at > ?', Time.zone.now)
  scope :expired, where('expire_at < ?', Time.zone.now)
  scope :current, where('post_at < ? and expire_at > ?', Time.zone.now, Time.zone.now)
  
  belongs_to :user, :foreign_key => "created_by"
  belongs_to :user, :foreign_key => "updated_by"
  belongs_to :user, :foreign_key => "approved_by"

  def init
    self.post_at ||= Time.zone.now if self.has_attribute? :post_at
    self.expire_at ||= Time.zone.now + 4.week if self.has_attribute? :expire_at
  end
end
