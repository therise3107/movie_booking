Rails.application.routes.draw do
  get 'shows/index'

  get 'shows/show'

  root 'movies#index'
  resources :movies 

  resources :shows do 
  	resource :booking
  end
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
