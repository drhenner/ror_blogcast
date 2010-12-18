class RemovePostIdFromAuthors < ActiveRecord::Migration
  def self.up
    remove_column :authors, :post_id
  end

  def self.down
    add_column :authors, :post_id, :integer
  end
end
