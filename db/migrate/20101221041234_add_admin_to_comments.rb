class AddAdminToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :admin, :boolean
  end

  def self.down
    remove_column :comments, :admin
  end
end
