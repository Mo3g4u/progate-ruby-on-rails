Rails.application.routes.draw do
  get 'posts/index'
  get "/" => "home#top"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "about" => "home#about"

  # Defines the root path route ("/")
  # root "articles#index"
end
