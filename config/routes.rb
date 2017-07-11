Rails.application.routes.draw do

  devise_for :providers, :controllers => { registrations: 'providers/registrations', sessions: 'providers/sessions', passwords: 'providers/passwords'}
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  get '/', to: 'pages#homepage'
  get '/homepage', to: 'pages#homepage', as: 'homepage'
  get '/contact', to: 'pages#contact', as: 'contact'
  get '/about', to: 'pages#about', as: 'about'

  get '/urgent', to: 'users#urgent', as: 'urgent'
  get '/result', to: 'users#result', as: 'result'
  get '/electricians', to: 'users#electricians', as: 'electricians'

  resources :users, only: [:index, :show] do
    member do
      resources :conversations
    end
  end
  resources :providers, only: [:index, :show] do
    member do
      resources :schedules, only: [:show, :new, :create, :update, :edit]
    end
    member do
      post 'like'
      delete 'unlike'
      put 'book'
    end
  end

  resources :joblistings do
    member do
      put 'accept'
      put 'decline'
    end
  end
  resources :invoice, except: [:destroy]

  namespace 'admin' do
    resources :joblistings
    resources :invoice, except: [:destroy]
    resources :providers, only: [:index]
    resources :users, only: [:index]
  end

end
