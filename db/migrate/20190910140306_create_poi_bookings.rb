class CreatePoiBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :poi_bookings do |t|
      t.references :connection, foreign_key: true
      t.references :poi, foreign_key: true
      t.boolean :booking_status
      t.datetime :date

      t.timestamps
    end
  end
end
