class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.integer :discount

      t.timestamps
    end
  end
end
