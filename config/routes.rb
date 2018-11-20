Rails.application.routes.draw do
  
  get 'sessions/new'
  root 'static_pages#home'
  get  '/lobby', to: 'static_pages#lobby'
  get '/chatroom', to: 'messages#index'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      post :exit
      post :join
    end
  end
  
  # get '/rooms/create', to:'rooms#new'
  # get '/videorooms/:id', to: 'messages#index', as: 'video_room'
  get '/videorooms/:id', to: 'static_pages#video_room', as: 'video_room'
  # post '/rooms/:id', to: 'rooms#create', as: 'create_room'
  resources :rooms do
    resource :users
    resources :messages
    collection do
      get :recent
      get :oldest
      get :mostUser
    end
  end

  resources :messages
  mount ActionCable.server, at: '/cable'
end
