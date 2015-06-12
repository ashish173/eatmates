class AddScoreToUser < ActiveRecord::Migration
  def change
    add_column :users, :score, :float
  end
end
