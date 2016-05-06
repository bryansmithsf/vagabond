Rails.application.routes.draw do

  root 'users#index'
  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "users/:id/edit", to: "users#edit", as:"user_edit"
  patch "/users/:id", to: "users#update"
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  get "/posts", to: "posts#index", as: "posts"
  get "/posts/new", to:"posts#new", as: "post_new"
  get "/posts/:post_id", to:"posts#show", as: "post"
  post "/posts", to:"posts#create"
  get "/posts/:post_id/edit", to: "posts#edit",as:"post_edit"
  patch "/posts/:post_id", to:"posts#update"
  delete "/posts/:post_id", to:"posts#destroy"
  
end
