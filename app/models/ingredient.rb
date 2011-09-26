class Ingredient < ActiveRecord::Base
  belongs_to :recipe, :foreign_key => "recipe_id"

  #def self.search(search)
  #  if search
  #    where('ing_name LIKE ?', "%#{search}%")
  #  else
  #    scoped
  #  end
  #end

  def self.my_search(search_items, search_type)
    last_element = search_items.last
    search_condition = " "

    search_items.each do |si|
      if si
        search_condition = search_condition + "ing_name LIKE '%#{si}%'"
        if si != last_element
          search_condition = search_condition + " " + search_type + " "
        end
      end
    end

    where (search_condition)

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
#  quantiy    :string(255)
#

