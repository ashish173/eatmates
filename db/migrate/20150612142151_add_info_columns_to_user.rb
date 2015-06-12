class AddInfoColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :age, :integer
    add_column :users, :photo_url, :text
    add_column :users, :eating_habits, :string
  end
end
