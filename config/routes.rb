DiamondClinic::Application.routes.draw do
  scope '(:locale)', :locale => /(en|pl)/ do
    devise_for :admin

    scope :admin, :as => :admin do
      get '/', :to => 'admin#index'
      get '/appointments', :to => 'admin#appointments'
      get '/doctors', :to => 'admin#doctors'
      get '/admins', :to => 'admin#admins'
    end

    get '/about_us', :to => 'home#about_us'
    get '/our_doctors', :to => 'home#our_doctors'
    get '/services', :to => 'home#services'
    get '/clinical_research', :to => 'home#clinical_research'
    get '/contact_us', :to => 'home#contact_us'

    root 'home#index'
  end
end
