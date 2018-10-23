Rails.application.routes.draw do
  
  get 'sessions/new'
  root 'static_pages#home'
  get  '/lobby', to: 'static_pages#lobby'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  
  get '/videorooms/create', to:'rooms#new'
  get '/videorooms/:id', to: 'static_pages#video_room', as: 'video_room'
  post '/videorooms/:id', to: 'rooms#create', as: 'create_room'
  resources :rooms
end
