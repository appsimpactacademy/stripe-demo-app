Rails.application.routes.draw do
  resources :workshops
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/create_booking' => 'tickets#create_booking'
end
