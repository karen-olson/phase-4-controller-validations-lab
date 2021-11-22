Rails.application.routes.draw do
  get '/posts/fiction', to: 'posts#fiction', as: 'posts_fiction'
  get '/posts/non-fiction', to: 'posts#non_fiction', as: "posts_non_fiction"
  resources :posts
  resources :authors, only: [:show, :create]

end
