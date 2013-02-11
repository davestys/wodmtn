class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def up
  	change_column :workouts, :date, :date
  end

  def down
  	change_column :my_table, :my_column, :datetime
  end
end
