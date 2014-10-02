class CreateVans < ActiveRecord::Migration
  def change
    create_table :vans do |t|
      t.string :driver
      t.string :direction
      t.datetime :departure_time
      t.integer :seats_available, default: 14
      t.integer :seats_occupied, default: 0

      t.timestamps
    end
  end
end
