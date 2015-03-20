class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :address
      t.integer :owner_id

      t.timestamps
    end
  end
end
