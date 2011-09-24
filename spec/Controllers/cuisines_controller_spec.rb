require 'spec_helper'
describe CuisinesController do
  render_views

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

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

end