Rails.application.routes.draw do
  
  
  root 'sessions#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  resources :books do
    resources :reviews, except: [:show, :create, :update]
  end

  resources :users do
    resources :reviews, only: [:index]
  end

  

  
  resources :catalogs
  resources :reviews, only: [:create, :update]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
