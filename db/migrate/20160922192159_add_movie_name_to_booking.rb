class AddMovieNameToBooking < ActiveRecord::Migration[5.0]
  def up
    add_column :bookings, :movie_name, :string
  end
  def down
  	remove_columns :bookings, :movie_name
  end
end
