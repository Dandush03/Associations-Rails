Rails.application.routes.draw do
  root 'users#show'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'singout', to: 'sessions#destroy'
  get 'sessions/destroy'
  get 'users/new', to: 'users#new', as: 'users'
  post 'users/new', to: 'users#create'
  get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
