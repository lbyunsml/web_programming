Rails.application.routes.draw do
	resources:artist
	root 'artist#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
