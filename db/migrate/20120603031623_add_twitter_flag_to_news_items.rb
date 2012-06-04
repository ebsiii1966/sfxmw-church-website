class AddTwitterFlagToNewsItems < ActiveRecord::Migration
  def self.up
    add_column :news_items, :twitter_flag, :boolean, :default => 0
  end

  def self.down
    remove_column :news_items, :twitter_flag
  end
end
