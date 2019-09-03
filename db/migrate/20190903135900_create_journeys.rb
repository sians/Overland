class CreateJourneys < ActiveRecord::Migration[5.2]
  def change
    create_table :journeys do |t|
      t.string :name
      t.string :start_city
      t.string :end_city
      t.string :booking_status
      t.boolean :archived
      t.references :user, foreign_key: true
      t.integer :total_cost

      t.timestamps
    end
  end
end
