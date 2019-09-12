class ChangeEndLatitudeToBeFloatInConnections < ActiveRecord::Migration[5.2]
  def change
    change_column :connections, :end_latitude, :float
  end
end
