class Org < ActiveRecord::Base
  validates :name, :summary, :description, :presence => true
  validates :name, :uniqueness => true 
  default_scope :order => :name
  
  has_many :news_items  
  belongs_to :parent, :class_name => 'Org'
  has_many :children, :class_name => 'Org', :foreign_key => 'group_id'
end
