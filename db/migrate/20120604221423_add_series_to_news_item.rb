class AddSeriesToNewsItem < ActiveRecord::Migration
  def self.up
    add_column :news_items, :series_id, :integer, :default => nil
  end

  def self.down
    remove_column :news_items, :series_id
  end
end
