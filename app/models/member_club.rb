class MemberClub < ActiveRecord::Base
    belongs_to :member
    belongs_to :club
end
