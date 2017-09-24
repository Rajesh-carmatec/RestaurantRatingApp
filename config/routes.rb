Rails.application.routes.draw do
  
  devise_for :users

  resources :restaurants do
  	resources :user_ratings, except: [:show, :index]
  end

  root to: 'restaurants#index'
end
