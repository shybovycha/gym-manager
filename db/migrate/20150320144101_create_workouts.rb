class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :title, null: false
      t.integer :club_id

      t.timestamps
    end
  end
end
