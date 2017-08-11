Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  resources :cocktails, only: [:index, :create, :new, :show] do
    resources :doses, only: [:create]
  end
  resources :doses, only: [:destroy]

  root "cocktails#index"
end
