class AddStuffToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :last_login, :datetime
    add_column :users, :rights, :string
    add_column :users, :active, :boolean, :default => 1
  end

  def self.down
    remove_column :users, :last_login
    remove_column :users, :rights
    remove_column :users, :active
  end
end
