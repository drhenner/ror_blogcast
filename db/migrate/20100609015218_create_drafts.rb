class CreateDrafts < ActiveRecord::Migration
  def self.up
    create_table :drafts do |t|
      t.string :title
      t.text :content
      t.string :author

      t.timestamps
    end
  end

  def self.down
    drop_table :drafts
  end
end
