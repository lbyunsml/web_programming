class ArtworkController < ApplicationController
  def index
    @artist = Artist.find(params[:artist_id])
    @artwork_all = @artist.artwork
  end
  def show
    @artist = Artist.find(params[:artist_id])
    @artwork = Artwork.find(params[:id])
  end
  def new
    if params[:artist_id].to_i!=session[:user_id]
      redirect_to root_path, flash: {danger: 'You have no permission'}
    end
  end
end
