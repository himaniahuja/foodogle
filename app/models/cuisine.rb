class Cuisine < ActiveRecord::Base

  has_many :recipes,   :dependent => :destroy
  accepts_nested_attributes_for :recipes

end

# == Schema Information
#
# Table name: cuisines
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

