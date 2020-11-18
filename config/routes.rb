Rails.application.routes.draw do
  
  
  root 'sessions#home'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get 'auth/github/callback', to: "sessions#github_create"

  get '/books/highest_ranked' => 'books#highest_ranked', as: :highest_ranked


  
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
