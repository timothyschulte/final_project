Rails.application.routes.draw do
root "recipes#index"


  devise_for :users
  
  
  get "/my_bookmarks", :controller => "bookmarks", :action => "index2"
  
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show" 
  
  
  # Routes for the Bookmark resource:
  # CREATE
  get "/bookmarks/new", :controller => "bookmarks", :action => "new"
  post "/create_bookmark", :controller => "bookmarks", :action => "create"

  # READ
  get "/bookmarks", :controller => "bookmarks", :action => "index"
  get "/bookmarks/:id", :controller => "bookmarks", :action => "show"

  # UPDATE
  get "/bookmarks/:id/edit", :controller => "bookmarks", :action => "edit"
  post "/update_bookmark/:id", :controller => "bookmarks", :action => "update"

  # DELETE
  get "/delete_bookmark/:id", :controller => "bookmarks", :action => "destroy"
  #------------------------------

  # Routes for the Recipes_ingredient resource:
  # CREATE
  get "/recipes_ingredients/new", :controller => "recipes_ingredients", :action => "new"
  post "/create_recipes_ingredient", :controller => "recipes_ingredients", :action => "create"

  # READ
  get "/recipes_ingredients", :controller => "recipes_ingredients", :action => "index"
  get "/recipes_ingredients/:id", :controller => "recipes_ingredients", :action => "show"

  # UPDATE
  get "/recipes_ingredients/:id/edit", :controller => "recipes_ingredients", :action => "edit"
  post "/update_recipes_ingredient/:id", :controller => "recipes_ingredients", :action => "update"

  # DELETE
  get "/delete_recipes_ingredient/:id", :controller => "recipes_ingredients", :action => "destroy"
  #------------------------------

  # Routes for the Genre resource:
  # CREATE
  get "/genres/new", :controller => "genres", :action => "new"
  post "/create_genre", :controller => "genres", :action => "create"

  # READ
  get "/genres", :controller => "genres", :action => "index"
  get "/genres/:id", :controller => "genres", :action => "show"

  # UPDATE
  get "/genres/:id/edit", :controller => "genres", :action => "edit"
  post "/update_genre/:id", :controller => "genres", :action => "update"

  # DELETE
  get "/delete_genre/:id", :controller => "genres", :action => "destroy"
  #------------------------------

  # Routes for the User resource:
  # CREATE
  get "/users/new", :controller => "users", :action => "new"
  post "/create_user", :controller => "users", :action => "create"

  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"

  # UPDATE
  get "/users/:id/edit", :controller => "users", :action => "edit"
  post "/update_user/:id", :controller => "users", :action => "update"

  # DELETE
  get "/delete_user/:id", :controller => "users", :action => "destroy"
  #------------------------------

  # Routes for the Ingredient resource:
  # CREATE
  get "/ingredients/new", :controller => "ingredients", :action => "new"
  post "/create_ingredient", :controller => "ingredients", :action => "create"

  # READ
  get "/ingredients", :controller => "ingredients", :action => "index"
  get "/ingredients/:id", :controller => "ingredients", :action => "show"

  # UPDATE
  get "/ingredients/:id/edit", :controller => "ingredients", :action => "edit"
  post "/update_ingredient/:id", :controller => "ingredients", :action => "update"

  # DELETE
  get "/delete_ingredient/:id", :controller => "ingredients", :action => "destroy"
  #------------------------------

  # Routes for the Recipe resource:
  # CREATE
  get "/recipes/new", :controller => "recipes", :action => "new"
  post "/create_recipe", :controller => "recipes", :action => "create"

  # READ
  get "/recipes", :controller => "recipes", :action => "index"
  get "/recipes/:id", :controller => "recipes", :action => "show"

  # UPDATE
  get "/recipes/:id/edit", :controller => "recipes", :action => "edit"
  post "/update_recipe/:id", :controller => "recipes", :action => "update"

  # DELETE
  get "/delete_recipe/:id", :controller => "recipes", :action => "destroy"
  
  # BOOKMARK
  get "/create_bookmark/:user_id/:recipe_id", :controller => "recipes", :action => "create_bookmark"
  
  
  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end
