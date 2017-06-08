class ArtworkController < ApplicationController
  def index
    redirect_to artist_path(params[:artist_id])
  end
  def show
    @artist = Artist.find(params[:artist_id])
    @artwork = Artwork.find(params[:id])
  end
  def new
    @artist = Artist.find(params[:artist_id])
    if params[:artist_id].to_i!=session[:user_id]
      redirect_to root_path, flash: {danger: 'You have no permission'}
    end
  end
  def create
    @artist = Artist.find(params[:artist_id])
    if artwork_params[:image] == nil
        @artwork = Artwork.new
        @artwork.errors[:base] << "You should upload image"
        render 'new'
    elsif artwork_params[:name] == ""
        @artwork = Artwork.new
        @artwork.errors[:base] << "You should write name"
        render 'new'
    else
      @artwork = @artist.artwork.create(artwork_params)
      if @artwork
        @artwork.update(img_path: @artwork.id.to_s+"_"+@artwork.image_file_name)
        redirect_to @artist, flash: {success: 'The artwork has added!'}
      else
        render 'new'
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def artwork_params
    params.require(:artwork).permit(:category, :name, :description, :image, :artist_id)
  end
end
