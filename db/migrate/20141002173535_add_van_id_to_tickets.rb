class AddVanIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :van_id, :integer
  end
end
