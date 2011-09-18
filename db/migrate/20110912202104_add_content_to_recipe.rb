class AddContentToRecipe < ActiveRecord::Migration
  def self.up
    add_column :recipes, :content, :text
  end

  def self.down
    remove_column :recipes, :content
  end
end
