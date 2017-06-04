class ArtistController < ApplicationController
    def index
      @artwork_all = Artwork.all
    end
	def new
      @artist_all = Artist.all
	end
    def show
      @artist = Artist.find(params[:id])
    end
end
