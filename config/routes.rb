Rails.application.routes.draw do
  get 'user_session/new'

  get    'login'   => 'user_session#new'
  post   'login'   => 'user_session#create'
  delete 'logout'  => 'user_session#destroy'

  resources :cats
  resource :dog
  resources :users
  post 'users/:id' => 'users#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
