class CreateClubsMembers < ActiveRecord::Migration
  def change
    create_table :clubs_members, id: false, primary_key: [ :member_id, :club_id ] do |t|
      t.integer :club_id
      t.integer :member_id
    end
  end
end
