class IngredientsController < ApplicationController

  def index

    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @recipes }
    end
  end

  def create

    @recipes = []
    @search_strings = []
    @search_type = "OR"

    if params[:search_1] != ""
      @search_strings << params[:search_1]
    end

     if params[:search_2] != ""
      @search_strings << params[:search_2]
    end

     if params[:search_3] != ""
      @search_strings << params[:search_3]
    end

     if params[:search_4] != ""
      @search_strings << params[:search_4]
     end




    @ingredients = Ingredient.my_search(@search_strings, @search_type)
    @ingredients.each do |ingredient|
        @recipe = Recipe.find(ingredient.recipe_id)

        if @recipes.index(@recipe) == nil
           @recipes << @recipe
        end

    end



    respond_to do |format|

      #if @recipes != []
        format.html # create.html.erb
       #else
         #format.html {render action (@recipe, :notice => 'Cuisine was successfully created.')  }
         #format.html {redirect_to "/ingredients/index", :notice => 'No Recipes available' }
       #end
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @cuisine = Cuisine.find(@recipe.cuisine_id)

    @ingredients = Ingredient.find(:all, :conditions => { :recipe_id => @recipe.id})

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
