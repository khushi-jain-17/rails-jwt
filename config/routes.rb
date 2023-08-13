Rails.application.routes.draw do

  post '/auth/login', to: 'authentication#login'
  resources :users
  resources :review
  get '/category', to: 'category#index', as: :category_movies
  
  get '/about',  to: 'movie#about'
  get '/search', to: 'movie#search'

  resources :movie do
    resources :review 
  end
end
