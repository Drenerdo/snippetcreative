Suitefolio::Application.routes.draw do

  resources :collaborates


  mount RailsAdmin::Engine => '/cortana', :as => 'rails_admin'

  devise_for :admins

  devise_for :users
  
  resources :users do
    member do
      get :following, :followers, :resume, :blog, :snips, :messages
    end
    resources :messages, only: [:create]
    resources :offers, only: [:new, :create]
    resources :tags, only: [:create, :destroy]
  end
  
  resources :relationships, only: [:create, :destroy, :show]
  resources :offers, only: [:show]
  resources :tags, only: [:show, :create, :destroy]
  resources :messages, only: [:index, :destroy]
  
  resources :jobs do
    resources :tags, only: [:create, :destroy]
    member do
      resources :applications, only: [:new, :create]
    end
  end
  
  resources :snips, only: [:new, :destroy, :show] do
    member do
      get :like, :likes, :unlike
    end
    resources :comments, only: [:create, :new]
  end
  
  resources :images, only: [:create, :edit, :update]
  resources :videos, only: [:create, :edit, :update]
  resources :websites, only: [:create, :edit, :update]
  
  resources :resumes, only: [:destroy, :new]
  resources :employments, only: [:create, :edit, :update]
  
  resources :likes, only: [:show]
  resources :notifications, only: [:index]
  resources :blogs
  
  resources :comments, only: [:new, :create, :destroy, :show]
  resources :apps, :controller => :applications
  resources :applications, only: :show
  
  get '/search', to: 'search#search'
  get '/search/users/', to: 'search#users'
  get '/search/jobs/', to: 'search#jobs'

  match ':id' => 'users#show', :via => :get, :as => :id
  
  root :to => "welcome#index"
end
