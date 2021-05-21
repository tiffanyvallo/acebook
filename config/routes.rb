Rails.application.routes.draw do
  root "users#index"

  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy' #log out link works on posts page but not profile page (users#show')
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    get 'signup', to:'users#new'
    post '/users', to: 'users#index' 
    # get 'profile' to: 'users#show' 
  end
  
  resources :posts do
    get '/like', to: 'posts#like'
  end

end
