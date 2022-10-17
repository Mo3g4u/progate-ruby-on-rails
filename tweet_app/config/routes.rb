Rails.application.routes.draw do
 
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "signup" => "users#new"
  get 'users/index'
  post "users/create" => "users#create"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"


  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  
  get "about" => "home#about"

  get "/" => "home#top"

end
