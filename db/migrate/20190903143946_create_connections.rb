class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.string :name
      t.string :transport_type
      t.string :provider
      t.string :provider_website
      t.boolean :booking_status
      t.decimal :cost
      t.string :origin_city
      t.string :destination_city
      t.references :journey, foreign_key: true

      t.timestamps
    end
  end
end
