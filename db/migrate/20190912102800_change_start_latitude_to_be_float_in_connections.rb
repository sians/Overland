class ChangeStartLatitudeToBeFloatInConnections < ActiveRecord::Migration[5.2]
  def change
    change_column :connections, :start_latitude, :float
  end
end
