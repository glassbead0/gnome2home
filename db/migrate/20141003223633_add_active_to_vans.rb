class AddActiveToVans < ActiveRecord::Migration
  def change
    add_column :vans, :active, :boolean, default: false
  end
end
