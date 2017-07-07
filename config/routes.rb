Rails.application.routes.draw do
  devise_for :providers, :controllers => { registrations: 'providers/registrations', sessions: 'providers/sessions', passwords: 'providers/passwords'}
  devise_for :users

  get '/homepage', to: 'users#homepage', as: 'homepage'
  get '/contact', to: 'users#contact', as: 'contact'
  get '/about', to: 'users#about', as: 'about'

  resources :joblistings

  resources :users
  resources :invoice
  resources :likes
  resources :providers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
