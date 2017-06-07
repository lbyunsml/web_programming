class ArtistController < ApplicationController
  def index
    @artwork_all = Artwork.all
  end
  def new
    @artist_all = Artist.new
	end
  def show
    @artist = Artist.find(params[:id])
    @artwork_all = @artist.artwork
  end
  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      flash[:success] = "The artist was added!"
      redirect_to @artist
    else
      render 'new'
    end
  end

  private
    def artist_params
      params.require(:artist).permit(:id, :image, :login_id, :password, :name, :description, :profile_img, :mail)
    end
end
