Rails.application.routes.draw do
  resources :artists do
  	resources :artworks
  end
  root to: 'artists#index'
end
