class HomeController < ApplicationController
  def index
  	if current_user
  		@total_workouts = current_user.workouts.all.count
  		@num_workouts_in_last_week = current_user.workouts.where('date >= ?', 1.week.ago).count
  	end
  end
end
