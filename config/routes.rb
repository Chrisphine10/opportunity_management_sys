Rails.application.routes.draw do
  
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  #get 'home/index'
  root 'home#index', as: 'home_index'
  resources :accounts 
  resources :opportunities
  
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
