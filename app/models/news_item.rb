class NewsItem < ActiveRecord::Base
  has_attached_file :picture, :styles => { :normal => "900X600", :thumb => "100X100" }
  validates :summary, :story, :presence => true
  default_scope :order => :created_at
  
  belongs_to :user, :foreign_key => "created_by"
  belongs_to :user, :foreign_key => "updated_by"
  belongs_to :user, :foreign_key => "approved_by"
end
