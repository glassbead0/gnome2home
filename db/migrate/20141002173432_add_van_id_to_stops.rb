class AddVanIdToStops < ActiveRecord::Migration
  def change
    add_column :stops, :van_id, :integer
  end
end
