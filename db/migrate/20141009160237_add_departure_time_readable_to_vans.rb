class AddDepartureTimeReadableToVans < ActiveRecord::Migration
  def change
    add_column :vans, :departure_time_readable, :string
  end
end
