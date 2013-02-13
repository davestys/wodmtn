class HomeController < ApplicationController
  def index
  	if current_user
  		@total_workouts = current_user.workouts.all.count
  		@num_workouts_in_last_week = current_user.workouts.where('date >= ?', 1.week.ago).count

  		@wods_for_current_year = current_user.workouts.find(:all, :conditions => ["strftime('%Y', date) = '?'", Date.today.year])
  		@wod_months = @wods_for_current_year.group_by { |w| w.date.beginning_of_month }
  	end
  end


end
