class AddProviderAndUidToPassengers < ActiveRecord::Migration
  def change
    add_column :passengers, :provider, :string
    add_column :passengers, :uid, :integer
  end
end
