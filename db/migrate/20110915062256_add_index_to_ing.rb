class AddIndexToIng < ActiveRecord::Migration
  def self.up
    add_index :ingredients, :recipe_id
  end

  def self.down
    remove_index :ingredients, :recipe_id
  end
end
