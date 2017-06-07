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

  def create

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artwork
      @artwork = Artwork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artwork_params
      params.require(:artwork).permit(:image, :name, :img_path, :description, :category, :artist_id)
    end
end