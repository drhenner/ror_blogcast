class AddDetailsToAuthors < ActiveRecord::Migration
  def self.up
    add_column :authors, :crypted_password, :string
    add_column :authors, :persistence_token, :string
    add_column :authors, :login_count, :integer
    add_column :authors, :failed_login_count, :integer
    add_column :authors, :last_request_at, :datetime
    add_column :authors, :current_login_at, :datetime
    add_column :authors, :last_login_at, :datetime
    add_column :authors, :current_login_ip, :string
    add_column :authors, :last_login_ip, :string
  end

  def self.down
    remove_column :authors, :last_login_ip
    remove_column :authors, :current_login_ip
    remove_column :authors, :last_login_at
    remove_column :authors, :current_login_at
    remove_column :authors, :last_request_at
    remove_column :authors, :failed_login_count
    remove_column :authors, :login_count
    remove_column :authors, :persistence_token
    remove_column :authors, :crypted_password
  end
end
