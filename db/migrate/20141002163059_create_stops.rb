class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :location
      t.datetime :time

      t.timestamps
    end
  end
end
