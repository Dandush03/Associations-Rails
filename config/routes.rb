Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'sessions/destroy'
  get 'users/new', to: 'users#new', as: 'users'
  post 'users/new', to: 'users#create'
  get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
