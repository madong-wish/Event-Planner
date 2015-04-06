# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
EventScheduler::Application.initialize!

ENV['RAILS_ENV'] = 'development'
ENV['RACK_ENV'] = 'development'
