class ChangeLongitudeToBeFloatInPois < ActiveRecord::Migration[5.2]
  def change
    change_column :pois, :longitude, :float, using: 'longitude::float'
  end
end
