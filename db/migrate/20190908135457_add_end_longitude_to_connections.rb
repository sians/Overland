class AddEndLongitudeToConnections < ActiveRecord::Migration[5.2]
  def change
    add_column :connections, :end_longitude, :integer
  end
end
