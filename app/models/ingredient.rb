class Ingredient < ActiveRecord::Base
  belongs_to :recipe, :foreign_key => "recipe_id"
end

# == Schema Information
#
# Table name: ingredients
#
#  id         :integer         not null, primary key
#  ing_name   :string(255)
#  recipe_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

