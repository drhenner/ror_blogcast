# Load the rails application
require File.expand_path('../application', __FILE__)

# Load custom config file for current environment
raw_config = File.read("config/config.yml")
BLOG_CONFIG = YAML.load(raw_config)[Rails.env]

# Initialize the rails application
DocEcommerce::Application.initialize!
