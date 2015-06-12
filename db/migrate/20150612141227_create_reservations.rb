class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :restaurant_name
      t.string :place
      t.datetime :time_of_reservation
      t.string :proposition
      t.integer :guests_number_pref
      t.string :gender_pref
      t.string :liquor_pref
      t.timestamps null: false
    end
  end
end
