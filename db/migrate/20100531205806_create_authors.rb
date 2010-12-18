class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
      t.string :name
      t.string :initials
      t.string :email
      t.string :password
      t.references :post

      t.timestamps
    end
  end

  def self.down
    drop_table :authors
  end
end
