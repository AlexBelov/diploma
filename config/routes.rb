Rails.application.routes.draw do
  resources :import, only: [:index] do
    collection do
      post :upload
    end
  end
  resources :map, only: [:index] do
    collection do
      get :population
    end
  end
end
