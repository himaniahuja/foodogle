require 'spec_helper'

describe Cuisine do

  before(:each) do
      @attr = { :title => "Example Cuisine", :description => "Example description" }
  end

  it "should create a new instance given valid attributes" do
    Cuisine.create!(@attr)
  end

  it "can be instantiated" do
    Cuisine.new.should be_an_instance_of(Cuisine)
  end

  it "can be saved successfully" do
    Cuisine.create.should be_new_record
  end

  it "should require a title" do
    no_title_cuisine = Cuisine.new(@attr.merge(:title => ""))
    no_title_cuisine.should_not be_valid
  end

  it "should require a description" do
    no_description_cuisine = Cuisine.new(@attr.merge(:description => ""))
    no_description_cuisine.should_not be_valid
  end

   it "should reject duplicate titles" do
    # Put a recipe with given name into the database.
      Cuisine.create!(@attr)
      cuisine_with_duplicate_title = Cuisine.new(@attr)
      cuisine_with_duplicate_title.should_not be_valid
   end




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

