Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root to: 'landing#index'

  get 'landing', to: 'landing#landing'

  resources :orders, only: :create

  resources :test_results, only: %i[show new] do
    member do
      get :profile
      post :create_single
    end
    collection do
      post :create
    end
  end

  ActiveAdmin.routes(self)
end
