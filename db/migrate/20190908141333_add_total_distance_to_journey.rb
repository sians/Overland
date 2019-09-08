class AddTotalDistanceToJourney < ActiveRecord::Migration[5.2]
  def change
    add_column :journeys, :total_distance, :string
  end
end
