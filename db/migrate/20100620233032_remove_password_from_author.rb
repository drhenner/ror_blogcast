class RemovePasswordFromAuthor < ActiveRecord::Migration
  def self.up
    remove_column :authors, :password
  end

  def self.down
    add_column :authors, :password, :string
  end
end
