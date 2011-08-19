class CreateOrgs < ActiveRecord::Migration
  def self.up
    create_table :orgs do |t|
      t.primary_key :id
      t.string :name
      t.string :summary
      t.text :description
      t.string :chair
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :orgs
  end
end
