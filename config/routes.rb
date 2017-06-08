Rails.application.routes.draw do
  get    'login'   => 'users#new'
  get 'home/index'
  post   'login'   => 'users#create'
  delete 'logout'  => 'users#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
