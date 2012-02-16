class AddGroupToOrgs < ActiveRecord::Migration
  def self.up
    add_column :orgs, :group_flag, :boolean
    add_column :orgs, :group_id, :integer
  end

  def self.down
    remove_column :orgs, :group_flag
    remove_column :orgs, :group_id
  end
end
