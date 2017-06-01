class ArtistController < ApplicationController
	def new
      @artist_all = Artist.all
	end
    def show
      @artist = Artist.find(params[:id])
    end
end
