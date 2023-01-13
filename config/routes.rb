Rails.application.routes.draw do
  root "top#index"
  devise_for :users, :controllers =>{
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :step_logs do 
    resource :favorites, only: [:create, :destroy]
  end
  resources :groups 

  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
