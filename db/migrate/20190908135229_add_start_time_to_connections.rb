class AddStartTimeToConnections < ActiveRecord::Migration[5.2]
  def change
    add_column :connections, :start_time, :string
  end
end
