DiamondClinic::Application.routes.draw do
  scope '(:locale)', :locale => /(en|pl)/ do
    devise_for :admin, :path_names => { :sign_in => :login, :sign_out => :logout }

    namespace :admin do
      resources :appointments, :only => [:index]
      resources :doctors, :only => [:index, :new, :create, :edit, :update]
      resources :admins, :only => [:index, :new, :create, :destroy]

      root 'appointments#index'
    end

    get '/about_us', :to => 'home#about_us'
    get '/our_doctors', :to => 'home#our_doctors'
    get '/services', :to => 'home#services'
    get '/clinical_research', :to => 'home#clinical_research'
    get '/contact_us', :to => 'home#contact_us'
    post '/contact_us', :to => 'home#appointment_create'

    root 'home#about_us'
  end
end
