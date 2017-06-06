class ArtworkController < ApplicationController
  def index
    @artist = Artist.find(params[:artist_id])
    @artwork_all = @artist.artwork
  end
  def show
    @artist = Artist.find(params[:artist_id])
    @artwork = Artwork.find(params[:id])
  end
end
