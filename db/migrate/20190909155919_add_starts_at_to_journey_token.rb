class AddStartsAtToJourneyToken < ActiveRecord::Migration[5.2]
  def change
    add_column :journey_tokens, :starts_at, :date
  end
end
