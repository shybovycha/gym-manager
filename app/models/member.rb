class Member < ActiveRecord::Base
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

    has_and_belongs_to_many :workouts, through: :members_workouts
    has_and_belongs_to_many :clubs, through: :member_clubs

    def is_member_of?(club)
        clubs.include? club
    end

    def name
        "#{first_name} #{last_name}"
    end
end
