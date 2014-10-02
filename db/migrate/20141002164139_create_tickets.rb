class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.boolean :scanned, default: false

      t.timestamps
    end
  end
end
