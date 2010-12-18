# config/initializers/mail.rb

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	:address => "mail.rorecommerce.com",
	:port => 25,
	:domain => "www.rorecommerce.com",
	:authentication => :login,
	:user_name => "user@rorecommerce.com",
	:password => "secret"
}