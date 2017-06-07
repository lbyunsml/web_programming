class ArtistController < ApplicationController
    def index
      @artwork_all = Artwork.all
    end
	def new
      @artist = Artist.new
      @artist_all = Artist.all
	end
    def create
      @artist = Artist.new(artist_params)
      if @artist.save
        @artist.update(profile_img: @artist.id.to_s+"_"+@artist.image_file_name)
        redirect_to @artist, flash: {success: 'The artist has added!'}
      else
        render 'new'
      end
    end
    def show
      @artist = Artist.find(params[:id])
      @artwork_all = @artist.artwork
    end
  
   # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:id, :login_id, :password, :name, :description, :image, :mail)
    end
end
