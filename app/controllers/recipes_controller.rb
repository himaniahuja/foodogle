class RecipesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

  # GET /recipes
  # GET /recipes.xml
  def index

   @recipes = Recipe.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
   @recipes.sort! {|a, b| a.name <=> b.name}


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

    @ingredients = Ingredient.find(:all, :order => "ing_name", :conditions => { :recipe_id => @recipe.id})

    @ingredients.each do |i|
      puts i.ing_name.class
    end

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

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

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


end


