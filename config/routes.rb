Rails.application.routes.draw do
  resources :users
  resources :movie
  post '/auth/login', to: 'authentication#login'
  # get '/about', to: 'movie#about'
  # get '/search', to: 'movie#search'
  # get '/category', to: 'categories#index', as: :category_movies
  # resources :movie do
  #   resources :review 
  #end
end
