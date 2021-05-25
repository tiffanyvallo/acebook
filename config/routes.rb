Rails.application.routes.draw do
  root "posts#index"
  
  resources :sessions
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy' #log out link works on posts page but not profile page (users#show')
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    get 'signup', to:'users#new'
    post '/users', to: 'users#index' 
    get 'profile', to: 'users#show' 
    get 'edit', to: 'users#edit'
  end
  
  resources :posts do
    get '/like', to: 'posts#like'
    resources :comments
  end

end
