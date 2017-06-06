class CategoryController < ApplicationController
  def index
    @c_list = ["Photo", "Metal", "East","West","Industrial","Illustration"]
    if params['cat'] != nil && @c_list.include?(params['cat'])
        @par = params['cat']
    else 
      redirect_to category_path+"/?cat=Photo"
    end
    @artwork_all = Artwork.where(category: @par)
  end
end
