class RecipesController < ApplicationController
  # GET /recipes
  # GET /recipes.xml
  def index
    @recipes = Recipe.all
    @recipes = Recipe.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.xml
  def show
    @recipe = Recipe.find(params[:id])
    @cuisine = Cuisine.find(@recipe.cuisine_id)

    @ingredients = Ingredient.find(:all, :conditions => { :recipe_id => @recipe.id})

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.xml
  def new
    @recipe = Recipe.new
    @cuisines = Cuisine.find(:all, :order => 'title')

    3.times do
      ingredient = @recipe.ingredients.build
    end


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/1/edit
  #def edit
  #  @recipe = Recipe.find(params[:id])
  #  @cuisines = Cuisine.find(:all, :order => 'title')
  #  @ingredients = Ingredient.all
  #end

  # POST /recipes
  # POST /recipes.xml


  def create
  @recipe = Recipe.new(params[:recipe])
  @cuisines = Cuisine.find(:all, :order => 'title')

   @recipe.ingredients.build
     respond_to do |format|
       if @recipe.save
            format.html { redirect_to(@recipe, :notice => 'Recipe was successfully created.') }
            format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
       else
           format.html { render :action => "new" }
           format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
       end

     end
  end


 # def get_ingredients(recipe)
  #  @ingredients = Ingredient.find(:all, :conditions => { :recipe_id => recipe})

  #  @ingredients.each do |ing|
  #    ing.ing_name
  #  end

 # end

  # PUT /recipes/1
  # PUT /recipes/1.xml
 # def update
 #   @recipe = Recipe.find(params[:id])

 #   respond_to do |format|
 #     if @recipe.update_attributes(params[:recipe])
 #       format.html { redirect_to(@recipe, :notice => 'Recipe was successfully updated.') }
 #       format.xml  { head :ok }
 #     else
 #     format.html { render :action => "edit" }
 #       format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
 #     end
 #   end
 #   @ingredient = Ingredient.create(:ing_name => params[:ing_name])
 #   respond_to do |format|
 #     if @ingredient.save
 #       format.html { redirect_to ingredients_path }
 #     else
 #       flash[:notice] = "Ingredient failed to save."
  #      format.html { redirect_to ingredients_path  }
 #     end
 #   end
 # end

  # DELETE /recipes/1
  # DELETE /recipes/1.xml
 # def destroy
 #   @recipe = Recipe.find(params[:id])
 #   @recipe.destroy
 #
 #   respond_to do |format|
 #     format.html { redirect_to(recipes_url) }
 #     format.xml  { head :ok }
 #   end
 # end
end
