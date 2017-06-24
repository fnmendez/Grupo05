Rails.application.routes.draw do

  # get '/users/auth/:provider/callback' => 'users/sessions#create'

  get '/series/new' => 'series#new', as: :new_series
  post '/series/new' => 'series#create'
  get '/series/:id/edit' => 'series#edit', as: :edit_series
  patch '/series/:id' => 'series#update'
  get '/search'=> 'searches#index'
  get '/search/results' => 'searches#results', as: :results
  post '/chapters/:id/share' => 'chapters#share', as: :share_chapter
  post '/series/:id/share' => 'series#share', as: :share_serie
  resources :series, only: [:index, :show, :delete]
  resources :series do
    resources :seasons, shallow: true
  end

  resources :seasons do
    resources :chapters, shallow: true
  end

  resources :chapters do
    resources :views, shallow: true
  end
  resources :chapters do
    resources :chapter_ratings, shallow: true
  end
  resources :chapters do
    resources :chapter_reviews, shallow: true
  end

  resources :chapter_acts, only: [:delete]
  resources :chapter_directeds, only: [:delete]

  # devise_for :users
  devise_for :user, controllers: {
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      sessions: 'users/sessions',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }, skip: [:sessions]

  as :user do
    get 'login' => 'users/sessions#new', as: :new_user_session
    post 'login' => 'users/sessions#create', as: :user_session
    get 'logout' => 'users/sessions#destroy', as: :destroy_user_session
    get 'register' => 'users/registrations#new'
  end

  resource :user, only: [:show]
  resources :users, only: [:index]
  get 'users/:id' => 'users#admin_show'
  delete 'users' => 'users#destroy', as: :destroy_users
  resources :users do
    member do
      get 'promote'
    end
  end
  
  resources :kids, only: [:index, :show, :new, :create]
  resources :stories
  delete 'kids' => 'users#destroy_kid', as: :destroy_kid

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "stories#index"
end
