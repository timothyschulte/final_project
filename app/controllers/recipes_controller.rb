class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    
    render("recipes/index.html.erb")
  end

  def show
    @recipe = Recipe.find(params[:id])
    @genre = Genre.find(@recipe.genre_id)
    
    render("recipes/show.html.erb")
  end
  
  def create_bookmark
    
    @bookmark = Bookmark.new
    @bookmark.user_id = params[:user_id]
    @bookmark.recipe_id = params[:recipe_id]
    save_status = @bookmark.save

    if save_status == true
      redirect_to("/bookmarks", :notice => "Bookmark created successfully.")
    else
      render("bookmarks/new.html.erb")
    end
    
  end

  def new
    @recipe = Recipe.new
    @genres = Genre.all
    @recipes_ingredients = RecipesIngredient.all
  
    
    # @genre = Genre.find(@recipe.genre_id)
    render("recipes/new.html.erb")
  end

  def create
    @recipe = Recipe.new

    @recipe.recipe_name = params[:recipe_name]
    @recipe.user_id = params[:user_id]
    @recipe.genre_id = params[:genre_id]
    @recipe.prep_time = params[:prep_time]
    # @recipe.ingredients = params[:ingredients]
    @recipe.decription = params[:decription]
    @recipe.recipe_text = params[:recipe_text]
    @recipe.img_location = params[:img_location]

    save_status = @recipe.save

    if save_status == true
      redirect_to("/recipes/#{@recipe.id}", :notice => "Recipe created successfully.")
    else
      render("recipes/new.html.erb")
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @genre = Genre.find(@recipe.genre_id)
    
    render("recipes/edit.html.erb")
  end


  def favorites
    @recipes = current_user.bookmarks
    render("recipes/bookmark.html.erb")
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.recipe_name = params[:recipe_name]
    @recipe.user_id = params[:user_id]
    @recipe.genre_id = params[:genre_id]
    @recipe.prep_time = params[:prep_time]
    @recipe.decription = params[:decription]
    @recipe.recipe_text = params[:recipe_text]
    @recipe.img_location = params[:img_location]

    save_status = @recipe.save

    if save_status == true
      redirect_to("/recipes/#{@recipe.id}", :notice => "Recipe updated successfully.")
    else
      render("recipes/edit.html.erb")
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    @recipe.destroy

    URI(request.referer).path == "/recipes/#{@recipe.id}"
      redirect_to("/", :notice => "Recipe deleted.")
    
  end
end
