class AddMarkdownToDrafts < ActiveRecord::Migration
  def self.up
    add_column :drafts, :markdown, :text
  end

  def self.down
    remove_column :drafts, :markdown
  end
end
