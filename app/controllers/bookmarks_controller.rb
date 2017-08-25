class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
    
    render("bookmarks/index.html.erb")
  end

  def index2
    @bookmarks = Bookmark.all
    
    render("my_bookmarks/index.html.erb")
  end
  
  def show
    @bookmark = Bookmark.find(params[:id])

    render("bookmarks.html.erb")
  end

  def new
    @bookmark = Bookmark.new

    render("bookmarks/new.html.erb")
  end

  def create
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

  def edit
    @bookmark = Bookmark.find(params[:id])

    render("bookmarks/edit.html.erb")
  end

  def update
    @bookmark = Bookmark.find(params[:id])

    @bookmark.user_id = params[:user_id]
    @bookmark.recipe_id = params[:recipe_id]

    save_status = @bookmark.save

    if save_status == true
      redirect_to("/bookmarks/#{@bookmark.id}", :notice => "Bookmark updated successfully.")
    else
      render("bookmarks/edit.html.erb")
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    @bookmark.destroy

    URI(request.referer).path == "/bookmarks}"
      redirect_to("/bookmarks", :notice => "Bookmark deleted.")
  end
end
