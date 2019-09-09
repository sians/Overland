class CreateJourneyTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :journey_tokens do |t|
      t.string :start_city
      t.string :end_city
      t.string :token

      t.timestamps
    end
  end
end
