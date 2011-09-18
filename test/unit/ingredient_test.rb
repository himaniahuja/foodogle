require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

