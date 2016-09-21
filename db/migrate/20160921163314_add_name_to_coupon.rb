class AddNameToCoupon < ActiveRecord::Migration[5.0]
  def up
    add_column :coupons, :name, :string
    add_index :coupons, :name
  end
  def down
  	remove_columns :coupons, :name
  end
end
