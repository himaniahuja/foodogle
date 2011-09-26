require 'spec_helper'
describe CuisinesController , :type => :controller do

  describe "GET 'show'" do

    before(:each) do
      @attr = { :title => "Example Cuisine", :description => "Example description" }
      @cuisine = Cuisine.create(@attr)
    end

    it "should be successful" do
      get :show, :id =>  @cuisine.id
      response.should be_success
    end

    it "should find the right cuisine" do
      get :show, :id => @cuisine.id
      assigns(:cuisine).should == @cuisine
    end

  end


  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do

      before(:each) do
        @attr = { :title => "Example Cuisine", :description => "Example description" }
        @cuisine = Cuisine.create(@attr)
      end

      it "should not create a cuisine" do
        lambda do
          post :create, :cuisine => @attr
        end.should_not change(Cuisine, :count)
      end


      it "should render the 'new' page" do
        post :create, :cuisine => @attr
        response.should render_template('new')
      end


    end


end