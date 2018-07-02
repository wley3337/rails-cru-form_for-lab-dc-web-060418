class GenresController < ApplicationController
  before_action :genre_select, only: [:show, :edit]

  def index
    @genres= Genre.all
  end

  def show

  end

  def edit

  end

  def update
    @genre = Genre.update(params[:id], genre_params(:name))
    puts params
    redirect_to genre_path(@genre)
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(genre_params(:name))
    @genre.id = Genre.last.id
    puts params
    redirect_to genre_path(@genre)
  end

  private

  def genre_params(*args)
    params.require(:genre).permit(*args)
  end

  def genre_select
    @genre = Genre.find(params[:id])
  end
end
