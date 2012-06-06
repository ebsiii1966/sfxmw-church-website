class NewsItem < ActiveRecord::Base
  has_attached_file :picture, :styles => { :normal => "780X600>", :small => "390X390", :thumb => "195X195" }
  validates :summary, :story, :presence => true
  #default_scope :order => :created_at
  
  scope :future, where('post_at > ?', Time.now)
  scope :expired, where('expire_at < ?', Time.now)
  scope :current, where('post_at < ? and expire_at > ?', Time.now, Time.now)
  scope :tweet, where("twitter_flag = 'f'")
  scope :series, lambda { |series_id| where('series_id = ?', series_id) }
  
  belongs_to :user, :foreign_key => "created_by"
  belongs_to :user, :foreign_key => "updated_by"
  belongs_to :user, :foreign_key => "approved_by"
end
