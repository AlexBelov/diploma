Rails.application.routes.draw do
  root to: "import#index"

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
  resources :pdf do
    collection do
      get :report
    end
  end
end
