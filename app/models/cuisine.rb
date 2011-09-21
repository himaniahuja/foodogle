class Cuisine < ActiveRecord::Base

  has_many :recipes,   :dependent => :destroy
  accepts_nested_attributes_for :recipes
  validates_presence_of :title
  validates_presence_of :description
  validates_uniqueness_of :title, :message => "The Cuisine already exists"

end

# == Schema Information
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

