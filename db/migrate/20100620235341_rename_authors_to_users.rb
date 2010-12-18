class RenameAuthorsToUsers < ActiveRecord::Migration
  def self.up
    rename_table :authors, :users
  end

  def self.down
    rename_table :users, :authors
  end
end
