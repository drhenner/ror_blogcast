# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#


unless User.first
  u = User.new( :name     => 'Big Admin',
                :initials => 'BA',
                :email    => 'admin@admin.com',
                :login    => 'admin',
                :password => 'admin',
                :password_confirmation => 'admin')
  r = u.save
end