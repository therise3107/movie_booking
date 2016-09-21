# == Schema Information
#
# Table name: coupons
#
#  id         :integer          not null, primary key
#  discount   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#
# Indexes
#
#  index_coupons_on_name  (name)
#

class Coupon < ApplicationRecord
end
