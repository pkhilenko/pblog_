Rails.application.routes.draw do
  resources :persons
  post 'persons/:id' => 'persons#update'
  root 'home#index'
end
