class AddTotalDurationToJourneys < ActiveRecord::Migration[5.2]
  def change
    add_column :journeys, :total_duration, :string
  end
end
