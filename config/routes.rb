Rails.application.routes.draw do
  resources :themes
  resources :images
  resources :values
  resources :users
  get 'main/index'
  get 'contacts', to: 'main#contacts', as: 'main_contacts'
  get 'help', to: 'main#help', as: 'main_help'
  get 'about', to: 'main#about', as: 'main_about'
  root 'main#index'
end
