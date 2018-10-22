Rails.application.routes.draw do
  
  root 'static_pages#home'
  get  '/lobby', to: 'static_pages#lobby'
  get '/signup', to: 'users#new'
  resources :users
end
