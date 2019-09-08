class AddStartLongitudeToConnections < ActiveRecord::Migration[5.2]
  def change
    add_column :connections, :start_longitude, :integer
  end
end
