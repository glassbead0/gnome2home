class AddColumnsToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :first_name, :string
    add_column :tickets, :last_name, :string
    add_column :tickets, :email, :string
    add_column :tickets, :qrcode, :string
  end
end
