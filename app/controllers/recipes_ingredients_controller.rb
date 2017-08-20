class RecipesIngredientsController < ApplicationController
  def index
    @recipes_ingredients = RecipesIngredient.all

    render("recipes_ingredients/index.html.erb")
  end

  def show
    @recipes_ingredient = RecipesIngredient.find(params[:id])

    render("recipes_ingredients/show.html.erb")
  end

  def new
    @recipes_ingredient = RecipesIngredient.new

    render("recipes_ingredients/new.html.erb")
  end

  def create
    @recipes_ingredient = RecipesIngredient.new

    @recipes_ingredient.recipe_id = params[:recipe_id]
    @recipes_ingredient.ingredient_id = params[:ingredient_id]

    save_status = @recipes_ingredient.save

    if save_status == true
      redirect_to("/recipes_ingredients/#{@recipes_ingredient.id}", :notice => "Recipes ingredient created successfully.")
    else
      render("recipes_ingredients/new.html.erb")
    end
  end

  def edit
    @recipes_ingredient = RecipesIngredient.find(params[:id])

    render("recipes_ingredients/edit.html.erb")
  end

  def update
    @recipes_ingredient = RecipesIngredient.find(params[:id])

    @recipes_ingredient.recipe_id = params[:recipe_id]
    @recipes_ingredient.ingredient_id = params[:ingredient_id]

    save_status = @recipes_ingredient.save

    if save_status == true
      redirect_to("/recipes_ingredients/#{@recipes_ingredient.id}", :notice => "Recipes ingredient updated successfully.")
    else
      render("recipes_ingredients/edit.html.erb")
    end
  end

  def destroy
    @recipes_ingredient = RecipesIngredient.find(params[:id])

    @recipes_ingredient.destroy

    if URI(request.referer).path == "/recipes_ingredients/#{@recipes_ingredient.id}"
      redirect_to("/", :notice => "Recipes ingredient deleted.")
    else
      redirect_to(:back, :notice => "Recipes ingredient deleted.")
    end
  end
end
