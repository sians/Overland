class AddTokenToJourneys < ActiveRecord::Migration[5.2]
  def change
    add_column :journeys, :token, :string
    add_index :journeys, :token, unique: true
  end
end
