Rails.application.routes.draw do

  get 'comments/index'

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

  get "/cities", to: "cities#index", as: "cities"
  get "/cities/new", to:"cities#new", as: "city_new"
  get "/cities/:city_id", to:"cities#show", as: "city"
  post "/cities", to:"cities#create"
  get "/cities/:city_id/edit", to: "cities#edit",as:"city_edit"
  patch "/cities/:city_id", to:"cities#update"
  delete "/cities/:city_id", to:"cities#destroy"

  get "/cities/:city_id/posts/new", to:"post_cities#new", as: "new_post"
  post "/cities/:city_id/posts", to:"post_cities#create", as: "city_posts"
  get "/cities/:city_id/posts/:post_id", to:"post_cities#show", as:"city_post"
  get "/cities/:city_id/posts", to:"post_cities#index"
  get "/cities/:city_id/posts/:post_id/edit", to:"post_cities#edit", as:"post_city_edit"
  patch "/cities/:city_id/posts/:post_id", to:"post_cities#update"
  delete "/cities/:city_id/posts/:post_id", to:"post_cities#destroy", as:"post_destroy"

  get "/cities/:city_id/posts/:post_id/comments", to:"comments#new", as: "new_comment"
  post "/cities/:city_id/posts/:post_id/comments", to:"comments#create"
  get "/cities/:city_id/posts/:post_id/comments/:comment_id", to:"comments#show", as:"comment"
  get "/cities/:city_id/posts/:post_id/comments", to:"comments#index", as:"comments"
  get "/cities/:city_id/posts/:post_id/comments/:comment_id/edit", to:"comments#edit", as:"city_post_comment"
  patch "/cities/:city_id/posts/:post_id/comments/:comment_id", to:"comments#update", as:"comment_update"
  delete "/cities/:city_id/posts/:post_id/comments/:comment_id", to:"comments#destroy", as:"comment_destroy"
end
