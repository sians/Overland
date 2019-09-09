class CreatePois < ActiveRecord::Migration[5.2]
  def change
    create_table :pois do |t|
      t.string :name
      t.string :google_place_id
      t.string :latitude
      t.string :longitude
      t.string :address
      t.integer :price_level
      t.string :category
      t.string :phone_number
      t.string :website

      t.timestamps
    end
  end
end
