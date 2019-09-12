class ChangeStartLongitudeToBeFloatInConnections < ActiveRecord::Migration[5.2]
  def change
    change_column :connections, :start_longitude, :float
  end
end
