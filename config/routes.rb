# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :categories

  root 'posts#index'

  resources :posts do
    scope module: 'posts' do
      resources :likes, only: %i[create destroy]
      resources :comments, only: %i[create edit update destroy]
    end
  end
end
