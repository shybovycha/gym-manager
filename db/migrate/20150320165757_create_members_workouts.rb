class CreateMembersWorkouts < ActiveRecord::Migration
  def change
    create_table :members_workouts, id: false, primary_key: [ :member_id, :workout_id ] do |t|
      t.integer :member_id
      t.integer :workout_id
    end
  end
end
