Rails.application.routes.draw do

  resources :users

  root 'sessions#new'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'
    get '/signup' => 'registrations#new'
    post '/signup' => 'registrations#create'

end
