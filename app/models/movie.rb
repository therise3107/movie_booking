# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  name       :string
#  fee        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
# Indexes
#
#  index_movies_on_slug  (slug) UNIQUE
#

class Movie < ApplicationRecord
	extend FriendlyId
 	friendly_id :name, use: :slugged

	has_many :shows
	has_many :theaters, through: :shows
	


end
