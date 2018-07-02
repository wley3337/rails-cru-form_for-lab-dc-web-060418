class SongsController < ApplicationController
  before_action :song_select, only: [:show, :edit]

  def index
    @songs= Song.all
  end

  def show

  end

  def edit

  end

  def update
    @song = Song.update(params[:id], songs_params(:name, :artist_id, :genre_id))
    puts params
    redirect_to song_path(@song)

  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(songs_params(:name, :artist_id, :genre_id))
    @song.id = Song.last.id
    puts params
    redirect_to song_path(@song)
  end

  private

  def songs_params(*args)
    params.require(:song).permit(*args)
  end

  def song_select
    @song = Song.find(params[:id])
  end



end
