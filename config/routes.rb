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
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
