class AddEndTimeToConnections < ActiveRecord::Migration[5.2]
  def change
    add_column :connections, :end_time, :string
  end
end
