require 'spec_helper'

describe "ViewRecipes", :type => :request do

  it "shows recipes" do

    visit '/recipes'
    assert page.has_content?('Click on the Recipe to view details')

  end

  it "adds a recipe" do

    visit '/recipes'
    click_link "Add Recipe"
    assert page.has_content?('New Recipe')
    fill_in 'Name', :with => 'Carrot pudding'
    fill_in 'Description', :with => 'Carrot pudding'
    fill_in 'Content', :with => 'Carrot pudding'

    click_button "Create Recipe"
    assert page.has_content?('Carrot pudding')
    click_link "Back"
    assert page.has_content?('Click on the Recipe to view details')
  end

end



