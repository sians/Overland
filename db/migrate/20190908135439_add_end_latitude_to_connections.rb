class AddEndLatitudeToConnections < ActiveRecord::Migration[5.2]
  def change
    add_column :connections, :end_latitude, :integer
  end
end
