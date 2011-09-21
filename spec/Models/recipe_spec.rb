require 'spec_helper'

describe Recipe do

  before(:each) do
      @attr = { :name => "Example Recipe", :description => "Example description", :cuisine_id => "example id", :content => "Example content" }
  end

  it "should create a new instance given valid attributes" do
    Recipe.create!(@attr)
  end

  it "can be instantiated" do
    Recipe.new.should be_an_instance_of(Recipe)
  end

  it "can be saved successfully" do
    Recipe.create.should be_new_record
  end

  it "should require a name" do
    no_name_recipe = Recipe.new(@attr.merge(:name => ""))
    no_name_recipe.should_not be_valid
  end


  it "should require a cuisine_id" do
    no_cuisine_id_recipe = Recipe.new(@attr.merge(:cuisine_id => ""))
    no_cuisine_id_recipe.should_not be_valid
  end


   it "should require a description" do
    no_description_recipe = Recipe.new(@attr.merge(:description => ""))
    no_description_recipe.should_not be_valid
   end

   it "should require content" do
     no_content_recipe= Recipe.new(@attr.merge(:content => ""))
     no_content_recipe.should_not be_valid
   end

   it "should reject names that are too long" do
    long_name = "a" * 21
    long_name_recipe = Recipe.new(@attr.merge(:name => long_name))
    long_name_recipe.should_not be_valid
   end

   it "should reject descriptions that are too long" do
    long_name = "a" * 71
    long_description_recipe = Recipe.new(@attr.merge(:description => long_name))
    long_description_recipe.should_not be_valid
   end

   it "should reject duplicate names" do
    # Put a recipe with given name into the database.
      Recipe.create!(@attr)
      recipe_with_duplicate_name = Recipe.new(@attr)
      recipe_with_duplicate_name.should_not be_valid
   end

end


