class Workout < ActiveRecord::Base
  attr_accessible :date, :location, :notes, :user_id
  belongs_to :user
end
