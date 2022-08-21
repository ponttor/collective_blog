# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  resources :posts, only: %i[show new create] do
    scope module: 'posts' do
      resources :likes, only: %i[create destroy]
      resources :comments, only: %i[create]
    end
  end
end
