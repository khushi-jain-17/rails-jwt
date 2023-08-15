Rails.application.routes.draw do

  post '/auth/login', to: 'authentication#login'
  resources :users
  get '/category', to: 'category#index', as: :category_movies
  get '/category/:id', to: 'category#index'  
  get '/about',  to: 'movie#about'
  get '/search', to: 'movie#search'
  resources :review
  resources :movie do
    resources :review 
  end
end
