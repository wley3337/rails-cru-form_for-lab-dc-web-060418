class ArtistsController < ApplicationController
  before_action :artist_select, only: [:edit, :show]


  def index
    @artists= Artist.all
  end

  def show

  end

  def edit

  end

  def update
    @artist = Artist.update(params[:id], artist_params(:name, :bio))

    puts params
    redirect_to artist_path(@artist)
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params(:name, :bio))
    @artist.id = Artist.last.id
    puts params
    redirect_to artist_path(@artist)

  end

  private

  def artist_params(*args)
    params.require(:artist).permit(*args)
  end

  def artist_select
    @artist = Artist.find(params[:id])
  end
end
