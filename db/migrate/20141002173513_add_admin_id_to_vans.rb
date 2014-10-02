class AddAdminIdToVans < ActiveRecord::Migration
  def change
    add_column :vans, :admin_id, :integer
  end
end
