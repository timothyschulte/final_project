class GenresController < ApplicationController
  def index
    @genres = Genre.all

    render("genres/index.html.erb")
  end

  def show
    @genre = Genre.find(params[:id])

    render("genres/show.html.erb")
  end

  def new
    @genre = Genre.new

    render("genres/new.html.erb")
  end

  def create
    @genre = Genre.new

    @genre.genre_name = params[:genre_name]

    save_status = @genre.save

    if save_status == true
      redirect_to("/genres/#{@genre.id}", :notice => "Genre created successfully.")
    else
      render("genres/new.html.erb")
    end
  end

  def edit
    @genre = Genre.find(params[:id])

    render("genres/edit.html.erb")
  end

  def update
    @genre = Genre.find(params[:id])

    @genre.genre_name = params[:genre_name]

    save_status = @genre.save

    if save_status == true
      redirect_to("/genres/#{@genre.id}", :notice => "Genre updated successfully.")
    else
      render("genres/edit.html.erb")
    end
  end

  def destroy
    @genre = Genre.find(params[:id])

    @genre.destroy

    if URI(request.referer).path == "/genres/#{@genre.id}"
      redirect_to("/", :notice => "Genre deleted.")
    else
      redirect_to(:back, :notice => "Genre deleted.")
    end
  end
end
