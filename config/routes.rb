# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/new', to: 'users#new', as: 'users'
  post 'users/new', to: 'users#create'
  get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
