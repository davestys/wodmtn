class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :location
      t.datetime :date
      t.text :notes

      t.timestamps
    end
  end
end
