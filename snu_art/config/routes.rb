Rails.application.routes.draw do
  get 'category/index'

	resources:artist do
      resources:artwork
    end
	root 'artist#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
