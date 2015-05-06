class MoviesController < ApplicationController

  def index
    if params[:title] || params[:director] || params[:runtime_in_minutes]
    
      @movies = Movie.search(params[:title].downcase, params[:director], params[:runtime_in_minutes])
    
    # pagination, commented out as design changed, considering reimplementing
    # @movies = Movie.search(params[:title], params[:director], params[:runtime_in_minutes]).page(params[:page]).per(10)
    else
      @movies = Movie.all
      # pagination, commented out as design changed, considering reimplementing
      # @movies = Movie.all.page(params[:page]).per(10)
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new 
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
  @movie = Movie.find(params[:id])
  @movie.destroy
  redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description, :image, :search_term
      )
  end
end
