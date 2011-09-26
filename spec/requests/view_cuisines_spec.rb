require 'spec_helper'

describe "ViewCuisines", :type => :request do

  it "shows cuisines" do

    visit '/cuisines'
    assert page.has_content?('Cuisines')

  end

  it "adds a cuisine" do

    visit '/cuisines'
    click_link "Add a Cuisine"
    assert page.has_content?('New Cuisine')
    fill_in 'Title', :with => 'Spanish'
    fill_in 'Description', :with => 'Spanish'
    click_button "Create Cuisine"
    assert page.has_content?('Spanish')
    click_link "Back"
    assert page.has_content?('Cuisines')
  end

end
