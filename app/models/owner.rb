class Owner < ActiveRecord::Base
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

    has_one :club

    def is_owner?(of_club)
        club == of_club
    end

    def has_club?
        club.present?
    end

    def has_no_club?
        club.blank?
    end
end
