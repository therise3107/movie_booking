class AddSlugToMovies < ActiveRecord::Migration[5.0]
  def up
    add_column :movies, :slug, :string
    add_index :movies, :slug, unique: true
  end
  def down
  	remove_columns :movies, :slug
  	remove_index :movies, :slug
  end
end
