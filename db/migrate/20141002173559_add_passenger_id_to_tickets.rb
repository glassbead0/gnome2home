class AddPassengerIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :passenger_id, :integer
  end
end
