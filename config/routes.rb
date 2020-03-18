Rails.application.routes.draw do
  root 'events#index'
  get 'events/new', to: 'events#new', as: 'events'
  post 'events/new', to: 'events#create'
  get 'events/show/:id/', to: 'events#show', as: 'event_show'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'singout', to: 'sessions#destroy'
  get 'users/new', to: 'users#new', as: 'users'
  post 'users/new', to: 'users#create'
  get 'users/show'
  post 'attend', to: 'events#attend_event'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
