require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: recipes
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  image_url   :string(255)
#  cuisine_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#  content     :text
#

