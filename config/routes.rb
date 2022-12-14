Rails.application.routes.draw do
  devise_for :users, :controllers =>{
    registrations: 'users/registrations',
    sessions: 'users/sessions'
    
  }
  resources :users
  root "top#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
