Rails.application.routes.draw do
  scope '(:locale)', locale: /(en|pl)/ do
    namespace :admin do
      get '/login', to: 'sessions#new'
      post '/login', to: 'sessions#create'
      get '/logout', to: 'sessions#destroy'

      resources :appointments, only: [:index]
      resources :doctors, only: [:index, :new, :create, :edit, :update, :destroy]
      resources :clinical_trials, only: [:index, :new, :create, :edit, :update, :destroy]
      resources :admins, only: [:index, :new, :create, :destroy]
      resource :password, only: [:edit, :update]

      root 'sessions#new'
    end

    resources :doctors, only: [] do
      get :photo, on: :member
    end

    get '/about_us', to: 'home#about_us'
    get '/our_doctors', to: 'home#our_doctors'
    get '/our_services', to: 'home#our_services'
    get '/clinical_research', to: 'home#clinical_research'
    get '/contact_us', to: 'home#contact_us'
    get '/request_appointment', to: 'home#request_appointment'
    post '/request_appointment', to: 'home#appointment_create'

    root 'home#about_us'
  end
end
