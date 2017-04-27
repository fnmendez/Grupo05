Rails.application.routes.draw do

  resources :series
  # devise_for :users
  devise_for :user, controllers: {
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }, skip: [:sessions]

  as :user do
    get 'login' => 'users/sessions#new', as: :new_user_session
    post 'login' => 'users/sessions#create', as: :user_session
    get 'logout' => 'users/sessions#destroy', as: :destroy_user_session
    get 'register' => 'users/registrations#new'
  end

  resource :user, only: [:show]

  resources :kids, only: [:index, :show, :new, :create]
  delete 'kids' => 'users#destroy_kid', as: :destroy_kid

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#index"
end
