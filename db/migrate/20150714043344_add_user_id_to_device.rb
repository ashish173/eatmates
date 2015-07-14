class AddUserIdToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :user_id, :integer
    add_column :reservations, :user_id, :integer
  end
end
