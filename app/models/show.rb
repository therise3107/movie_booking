# == Schema Information
#
# Table name: shows
#
#  id             :integer          not null, primary key
#  movie_id       :integer
#  theater_id     :integer
#  bookings_count :integer
#  start_time     :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_shows_on_movie_id    (movie_id)
#  index_shows_on_theater_id  (theater_id)
#
# Foreign Keys
#
#  fk_rails_9e13f841bc  (movie_id => movies.id)
#  fk_rails_cca9363be1  (theater_id => theaters.id)
#

class Show < ApplicationRecord
  include Filterable

  belongs_to :movie
  belongs_to :theater
  has_many :bookings
  has_many :users, through: :bookings
  validates :bookings, length: { maximum: 100 }

  scope :theater_name, -> (name){ where(theater: Theater.find_by(name: name )) }

  def seats
  	100 - (self.bookings_count || 0)
  end




end
