class AddQuantityToIngredient < ActiveRecord::Migration
  def self.up
    add_column :ingredients, :quantiy, :string
  end

  def self.down
    remove_column :ingredients, :quantiy
  end
end
