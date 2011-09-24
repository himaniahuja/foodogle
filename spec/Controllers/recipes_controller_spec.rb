require 'spec_helper'


describe RecipesController do
  render_views

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'show'" do

    before(:each) do
      @attr = { :name => "Example Recipe", :description => "Example description", :cuisine_id => "1", :content => "Example content" }
      @cuisine= Cuisine.create(:title=> "example", :description=> "desc")
      @recipe = Recipe.create(@attr)
    end

    it "should be successful" do
      get :show, :id =>  @recipe.id
      response.should be_success
    end

    it "should find the right recipe" do
      get :show, :id => @recipe.id
      assigns(:recipe).should == @recipe
    end

  end

end