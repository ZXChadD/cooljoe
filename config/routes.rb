Rails.application.routes.draw do
  devise_for :providers, :controllers => { registrations: 'providers/registrations', sessions: 'providers/sessions', passwords: 'providers/passwords'}
  devise_for :users

  get '/homepage', to: 'users#homepage', as: 'homepage'
  get '/contact', to: 'users#contact', as: 'contact'
  get '/about', to: 'users#about', as: 'about'
  get '/urgent', to: 'users#urgent', as: 'urgent'
  get '/result', to: 'users#result', as: 'result'
  get '/electricians', to: 'users#electricians', as: 'electricians'

  resources :users, only: [:index, :show]
  resources :providers, only: [:index, :show]
  resources :joblistings
  resources :likes, only: [:create, :destroy]

  namespace 'admin' do
    resources :joblistings
    resources :invoice, except: [:destroy]
    resources :providers, only: [:index]
    resources :users, only: [:index]
  end

end
