class CreateNewsItems < ActiveRecord::Migration
  def self.up
    create_table :news_items do |t|
      t.string :summary
      t.text :story
      t.string :image_url
      t.integer :created_by
      t.integer :updated_by
      t.integer :approved_by
      t.datetime :post_at
      t.datetime :expire_at
      t.integer :org_id

      t.timestamps
    end
  end

  def self.down
    drop_table :news_items
  end
end
