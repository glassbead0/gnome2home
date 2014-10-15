class AddPhoneToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :phone, :string
  end
end
