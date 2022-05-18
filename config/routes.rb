Rails.application.routes.draw do
  devise_for :users
  resources :categories

  root 'posts#index'

  resources :posts do
    scope module: 'posts' do
      resources :comments, only: [:create, :edit, :update, :destroy,]
    end
  end

end
