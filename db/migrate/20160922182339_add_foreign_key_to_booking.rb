class AddForeignKeyToBooking < ActiveRecord::Migration[5.0]
  def change
  	remove_column :bookings,:show_id, :integer
    add_reference :bookings, :show, foreign_key: true
  end

end
