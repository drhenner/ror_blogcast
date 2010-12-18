class AddPostedAtToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :posted_at, :datetime
  end

  def self.down
    remove_column :posts, :posted_at
  end
end
