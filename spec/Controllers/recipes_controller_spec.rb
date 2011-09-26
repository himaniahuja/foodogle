require 'spec_helper'


describe RecipesController, :type => :controller do

    describe "GET 'new'" do
     it "should be successful" do
        get 'new'
        response.should be_success
      end
    end

    describe "GET 'show'" do

      before(:each) do
        @attr = {:name => "Example Recipe", :description => "Example description", :image_url => "img01.jpg", :cuisine_id => "1", :content => "Example content" }
        @cuisine= Cuisine.create(:title=> "example", :description=> "desc")
        @recipe = Recipe.create(@attr)
      end

      it "should be successful" do
        get :show, :id =>@recipe.id
        response.should be_success
      end

      it "should find the right recipe" do
        get :show, :id =>@recipe.id
        assigns(:recipe).should == @recipe
      end


    end

    describe "GET 'create'" do

      before(:each) do
        @attr = { :name => "", :description => "", :image_url => "", :cuisine_id => "", :content => "" }
        @cuisine= Cuisine.create(:title=> "", :description=> "")
        @recipe = Recipe.create(@attr)
      end

      it "should not create a recipe" do
        lambda do
          post :create, :recipe => @attr
        end.should_not change(Recipe, :count)
      end


      it "should render the 'new' page" do
        post :create, :recipe => @attr
        response.should render_template('new')
      end


    end

end