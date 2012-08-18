class CreateForms < ActiveRecord::Migration
  def self.up
    create_table :forms do |t|
      t.string :name
      t.string :notes
      t.string :form_url
      t.integer :created_by
      t.integer :updated_by
      t.integer :approved_by
      t.datetime :post_at
      t.datetime :expire_at
      t.integer :org_id
      t.integer :form_content_type
      t.integer :form_file_size
      t.string :form_file_name
      t.datetime :form_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :forms
  end
end
