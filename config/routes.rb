Rails.application.routes.draw do

  devise_for :providers, :controllers => { registrations: 'providers/registrations', sessions: 'providers/sessions', passwords: 'providers/passwords'}
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  authenticated :user do
    root 'users#index'
  end

  authenticated :provider do
    root 'providers#index'
  end

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
    member do
      resources :messages, only: [:new, :create, :destroy]
    end
  end

  resources :providers, only: [:index, :show] do
    member do
      resources :comments
    end
    member do
      get '/allmessages', to: 'conversations#allmessages', as: 'allmessages'
      get '/showmessages/:conversation_id', to: 'conversations#showmessages', as: 'showmessages'
    end
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
  resources :invoices

  namespace 'admin' do
    resources :joblistings
    resources :invoices

    resources :providers, only: [:index]
    resources :users, only: [:index]
    get 'statistics'
  end

  resources :payments, only: [:new, :show, :create]

end
