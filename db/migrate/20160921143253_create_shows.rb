class CreateShows < ActiveRecord::Migration[5.0]
  def change
    create_table :shows do |t|
      t.references :movie, foreign_key: true
      t.references :theater, foreign_key: true
      t.integer :bookings_count
      t.datetime :start_time

      t.timestamps
    end
  end
end
