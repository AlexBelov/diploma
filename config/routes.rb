Rails.application.routes.draw do
  resources :import, only: [:index] do
    collection do
      post :upload
    end
  end
end
