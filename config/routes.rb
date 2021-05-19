Rails.application.routes.draw do
  root "users#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  resources :users
<<<<<<< HEAD
  resources :posts
=======

  # resources :posts
>>>>>>> 2d3f252cc4f0de4c1705c0c321793a96a0cced00
end
