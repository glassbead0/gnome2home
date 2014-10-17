class AddImageToPassengers < ActiveRecord::Migration
  def change
    add_column :passengers, :image, :string
  end
end
