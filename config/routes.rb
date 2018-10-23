Rails.application.routes.draw do
  
  get 'sessions/new'
  root 'static_pages#home'
  get  '/lobby', to: 'static_pages#lobby'
  get '/chatroom', to: 'messages#index'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :messages
  mount ActionCable.server, at: '/cable'
end
