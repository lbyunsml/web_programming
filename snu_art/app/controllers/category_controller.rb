class CategoryController < ApplicationController
  def index
    if params['cat'] != nil && ["photo", "metal", "oriental"].include?(params['cat'])
        @par = params['cat']
    else 
      redirect_to category_path+"/?cat=metal"
    end
    @artwork_all = Artwork.where(category: @par)
  end
end
