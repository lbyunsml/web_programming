class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]

  # GET /artworks
  # GET /artworks.json
  def index
    @artworks = Artwork.order('created_at')
  end

  # GET /artworks/1
  # GET /artworks/1.json
  def show
  end

  # GET /artworks/new
  def new
    @artwork = Artwork.new
  end

  # GET /artworks/1/edit
  def edit
  end

  # POST /artworks
  # POST /artworks.json
  def create
    @artist = Artist.find(params[:artist_id])
    @artwork = @artist.artworks.create(artwork_params)
    if @artwork.save
      flash[:success] = "The artwork was added!"
      redirect_to artist_path(@artist)
    else
      render 'new'
    end
    #redirect_to artist_path(@artist)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artwork
      @artwork = Artwork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artwork_params
      params.require(:artwork).permit(:image, :title, :img_path, :description, :category, :artist_id)
    end
end
