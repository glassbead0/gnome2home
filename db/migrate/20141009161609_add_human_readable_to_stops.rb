class AddHumanReadableToStops < ActiveRecord::Migration
  def change
    add_column :stops, :human_readable, :string
  end
end
