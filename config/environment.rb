# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
EventScheduler::Application.initialize!

RAILS_ENV = 'development'
RACK_ENV = 'development'
