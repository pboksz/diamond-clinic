DiamondClinic::Application.routes.draw do
  scope '(:locale)', :locale => /(en|pl)/ do
    devise_for :admin

    scope :admin, :as => :admin do
      get '/', :to => 'admin#index'
      get '/appointments', :to => 'admin#appointments'
      get '/doctors', :to => 'admin#doctors'
      post '/doctors', :to => 'admin#doctors_create'
      get '/doctors/new', :to => 'admin#doctors_new'
      get '/admins', :to => 'admin#admins'
      post '/admins', :to => 'admin#admins_create'
      get '/admins/new', :to => 'admin#admins_new'
    end

    get '/about_us', :to => 'home#about_us'
    get '/our_doctors', :to => 'home#our_doctors'
    get '/services', :to => 'home#services'
    get '/clinical_research', :to => 'home#clinical_research'
    get '/contact_us', :to => 'home#contact_us'
    post '/contact_us', :to => 'home#appointment_create'

    root 'home#index'
  end
end
