class AddStartLatitudeToConnections < ActiveRecord::Migration[5.2]
  def change
    add_column :connections, :start_latitude, :integer
  end
end
