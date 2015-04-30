class Event < ActiveRecord::Base
  attr_accessible :name, :datetime, :location, :description
end
