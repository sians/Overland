class ChangeLatitudeToBeFloatInPois < ActiveRecord::Migration[5.2]
  def change
    change_column :pois, :latitude, :float, using: 'latitude::float'
  end
end
