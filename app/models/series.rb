class Series < ActiveRecord::Base
  validates :name, :description, :presence => true
  validates :name, :uniqueness => true 
  default_scope :order => :name
  
  has_many :news_items 
end
