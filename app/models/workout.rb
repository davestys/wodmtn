class Workout < ActiveRecord::Base
  attr_accessible :date, :location, :notes, :user_id
  belongs_to :user

  scope :recent, order("date ASC LIMIT 1")
end
