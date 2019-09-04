class AddStorageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :storage, :json
  end
end
