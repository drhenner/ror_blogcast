class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string  :name
      t.string  :email
      t.string  :website
      t.integer :post_id
      t.text    :content
      t.integer :commentable_id
      t.string  :commentable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
