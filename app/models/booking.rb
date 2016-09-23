# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  total      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  show_id    :integer
#  movie_name :string
#
# Indexes
#
#  index_bookings_on_show_id  (show_id)
#  index_bookings_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_ef0571f117  (user_id => users.id)
#  fk_rails_f6de0bbe34  (show_id => shows.id)
#

class Booking < ApplicationRecord

  belongs_to :user
  belongs_to :show ,counter_cache: true


  def movie
  	self.include(:show).movie.name
  end
end
