class MembersWorkouts < ActiveRecord::Base
    belongs_to :member
    belongs_to :workout
end
