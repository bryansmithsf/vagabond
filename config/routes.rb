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
  get "posts/new", to:"posts#new", as: "post_new"
  get "/posts/:post_id", to:"posts#show", as: "post"
  post "/posts", to:"posts#create"
  get "/posts/:post_id/edit", to: "posts#edit",as:"post_edit"
  patch "/posts/:post_id", to:"posts#update"
  delete "/posts/:post_id", to:"posts#destroy"

  get "/cities", to: "cities#index", as: "cities"
  get "/cities/new", to:"cities#new", as: "city_new"
  get "/cities/:city_id", to:"cities#show", as: "city"
  post "/cities", to:"cities#create"
  get "/cities/:city_id/edit", to: "cities#edit",as:"city_edit"
  patch "/cities/:city_id", to:"cities#update"
  delete "/cities/:city_id", to:"cities#destroy"

  get "/cities/:city_id/posts/new", to:"posts#new", as: "new_post"
  post "/cities/:city_id/posts", to:"posts#create", as: "city_posts"
  get "/cities/:city_id/posts/:post_id", to:"post_cities#show", as:"city_post"
  get "/cities/:city_id/posts", to:"post_cities#index"
  get "/cities/:city_id/posts/:post_id/edit", to:"post_cities#edit", as:"post_city_edit"
  patch "/cities/:city_id/posts/:post_id", to:"post_cities#update"
  delete "/cities/:city_id/posts/:post_id", to:"post_cities#destroy"
end
