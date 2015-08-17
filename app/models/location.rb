class Location < ActiveRecord::Base
  has_many :lesson_schedules
end
