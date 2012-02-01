class AddTopFlagToNewsItems < ActiveRecord::Migration
  def self.up
    add_column :news_items, :top_flag, :boolean
  end

  def self.down
    remove_column :news_items, :top_flag
  end
end
