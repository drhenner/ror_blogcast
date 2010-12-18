class AddMarkdownToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :markdown, :text
  end

  def self.down
    remove_column :posts, :markdown
  end
end
