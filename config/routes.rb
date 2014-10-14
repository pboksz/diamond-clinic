DiamondClinic::Application.routes.draw do
  scope '(:locale)', :locale => /(en|pl)/ do
    devise_for :admin, :path_names => { :sign_in => :login, :sign_out => :logout }

    namespace :admin do
      resources :appointments, :only => [:index]
      resources :doctors, :only => [:index, :new, :create, :edit, :update]
      resources :clinical_trials, :only => [:index, :new, :create, :destroy]
      resources :admins, :only => [:index, :new, :create, :destroy]
      resource :password, :only => [:edit, :update]

      root 'appointments#index'
    end

    get '/about_us', :to => 'home#about_us'
    get '/our_doctors', :to => 'home#our_doctors'
    get '/our_services', :to => 'home#our_services'
    get '/clinical_research', :to => 'home#clinical_research'
    get '/contact_us', :to => 'home#contact_us'
    get '/request_appointment', :to => 'home#request_appointment'
    post '/request_appointment', :to => 'home#appointment_create'

    root 'home#about_us'
  end
end
