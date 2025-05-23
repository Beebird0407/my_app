Rails.application.routes.draw do
  namespace :api do
    get 'next_image', to: 'api/api#next_image'
    get 'prev_image', to: 'api/api#prev_image'
  end
  get 'work/index'
  get 'work/choose_theme'
  get 'work/display_theme'
  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  post   'signin',  to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'
  resources :themes
  resources :sessions,only: [:new,:create,:destroy]
  resources :images
  resources :values
  resources :users
  #work
  get 'work', to: 'work#index'
  get 'choose_theme', to: 'work#choose_theme'
  post 'display_theme', to: 'work#display_theme'

  #root'work#index'
  get 'main/index'
  get 'contacts', to: 'main#contacts', as: 'main_contacts'
  get 'help', to: 'main#help', as: 'main_help'
  get 'about', to: 'main#about', as: 'main_about'
  root 'main#index'
end
