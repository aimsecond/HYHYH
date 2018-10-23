Rails.application.routes.draw do
  get '/videorooms/create', to:'rooms#new'
  get '/videorooms/:id', to: 'static_pages#video_room', as: 'video_room'
  post '/videorooms/:id', to: 'rooms#create', as: 'create_room'
  root 'application#hello'
  resources :rooms
end
