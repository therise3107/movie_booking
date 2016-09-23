# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  name       :string
#  fee        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Movie < ApplicationRecord
	

	has_many :shows
	has_many :theaters, through: :shows
	


end
