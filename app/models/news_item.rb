class NewsItem < ActiveRecord::Base
  validates :summary, :story, :presence => true
  default_scope :order => :created_at
  
  belongs_to :user, :foreign_key => "created_by"
  belongs_to :user, :foreign_key => "updated_by"
  belongs_to :user, :foreign_key => "approved_by"
end
