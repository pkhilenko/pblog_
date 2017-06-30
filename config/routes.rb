Rails.application.routes.draw do
  # get '/petrablog', to: 'petrablog#index', as: 'petrablog'
  # get '/petrablog/:id', to: 'petrablog#show'

  resources :petrablog

  resources :persons
  post 'persons/:id' => 'persons#update'
  root 'home#index'
end
