Rails.application.routes.draw do
  
  get 'admin' => 'admin#index'
  get 'home' => 'home#show'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  root 'home#index', as: 'home_index'
  resources :accounts do
    resources :opportunities
  end
  
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
