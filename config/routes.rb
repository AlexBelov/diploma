Rails.application.routes.draw do
  root to: "import#index"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :github_data, only: [:index, :show]
  resources :companies, only: [:index]
  resources :imported_data, only: [:index]
  resources :linkedin, only: [:index]

  resources :import, only: [:index] do
    collection do
      post :upload
    end
  end

  resources :map, only: [:index] do
    collection do
      get :users
      get :companies
      get :all_addresses
      get :user_addresses
      get :company_addresses
    end
  end

  resources :progress, only: [:index]

  resources :pdf do
    collection do
      get :report
    end
  end
end
