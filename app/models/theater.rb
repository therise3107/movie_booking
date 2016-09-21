# == Schema Information
#
# Table name: theaters
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Theater < ApplicationRecord

	has_many :shows
	has_many :movies, through: :shows

	# validates :shows, uniqueness: true

end
