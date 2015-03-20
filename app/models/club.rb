class Club < ActiveRecord::Base
    belongs_to :owner
    has_many :workouts
    has_and_belongs_to_many :members, through: :clubs_members
end
