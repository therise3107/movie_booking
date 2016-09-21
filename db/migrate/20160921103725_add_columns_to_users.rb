class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def up
  	add_column :users, :name, :string, required: true
  	add_column :users, :gender, :string, reuired: true
  end
  def down
  	remove_columns :users, :name, :gender
  end
end
