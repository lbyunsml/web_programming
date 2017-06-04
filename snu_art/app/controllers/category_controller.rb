class CategoryController < ApplicationController
  def index
    @artwork_all = Artwork.all
  end
end
