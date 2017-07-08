Rails.application.routes.draw do

  devise_for :providers, :controllers => { registrations: 'providers/registrations', sessions: 'providers/sessions', passwords: 'providers/passwords'}
  devise_for :users

  get '/', to: 'pages#homepage'
  get '/homepage', to: 'pages#homepage', as: 'homepage'
  get '/contact', to: 'pages#contact', as: 'contact'
  get '/about', to: 'pages#about', as: 'about'

  get '/urgent', to: 'users#urgent', as: 'urgent'
  get '/result', to: 'users#result', as: 'result'
  get '/electricians', to: 'users#electricians', as: 'electricians'

  resources :users, only: [:index, :show]
  resources :providers, only: [:index, :show]
  resources :joblistings
  resources :likes, only: [:create, :destroy]
  resources :invoice, except: [:destroy]


  namespace 'admin' do
    resources :joblistings
    resources :invoice, except: [:destroy]
    resources :providers, only: [:index]
    resources :users, only: [:index]
  end

end
