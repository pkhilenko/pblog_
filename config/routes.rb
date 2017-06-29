Rails.application.routes.draw do
  get 'petrablog/index'

  resources :persons
  post 'persons/:id' => 'persons#update'
  root 'home#index'
end
