class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.order('created_at')
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  def show

  end

  # POST /artists
  # POST /artists.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:id, :image, :login_id, :password, :name, :description, :profile_img, :mail)
    end
end
