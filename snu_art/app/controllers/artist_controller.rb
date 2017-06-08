class ArtistController < ApplicationController
    def index
      @artwork_all = Artwork.all
    end
	def new
      @artist_all = Artist.all
	end
    def create
      if artist_params[:password] != params[:artist][:c_password]
        @artist = Artist.new
        @artist.errors[:base] << "Password should be same"
        render 'new'
      elsif artist_params[:image] == nil
        @artist = Artist.new
        @artist.errors[:base] << "You should upload image"
        render 'new'
      else
        @artist = Artist.new(artist_params)
        if @artist.save
          @artist.update(profile_img: @artist.id.to_s+"_"+@artist.image_file_name)
          redirect_to @artist, flash: {success: 'The artist has added!'}
        else
          render 'new'
        end
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
