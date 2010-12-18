class RemoveDraftFromPosts < ActiveRecord::Migration
  def self.up
    remove_column :posts, :draft
  end

  def self.down
    add_column :posts, :draft, :boolean
  end
end
