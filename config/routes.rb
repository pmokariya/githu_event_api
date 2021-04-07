Rails.application.routes.draw do
  resources :events
  resources :actors
  resources :repos do
    member do
      get :events
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
