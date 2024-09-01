Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "cold_rainbow#index"

  resources :cold_rainbow do
    collection do
      post "/reload", to: "cold_rainbow#reload"
      post "/reload_without_contrast", to: "cold_rainbow#reload_without_contrast"
    end
  end
end
