class ClubsMembers < ActiveRecord::Base
    belongs_to :club
    belongs_to :member
end
