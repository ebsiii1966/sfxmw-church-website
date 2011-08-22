class Org < ActiveRecord::Base
  validates :name, :summary, :description, :presence => true
  validates :name, :uniqueness => true 
end
