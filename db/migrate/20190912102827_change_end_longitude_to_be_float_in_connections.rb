class ChangeEndLongitudeToBeFloatInConnections < ActiveRecord::Migration[5.2]
  def change
    change_column :connections, :end_longitude, :float
  end
end
