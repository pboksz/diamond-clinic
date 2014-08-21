DiamondClinic::Application.routes.draw do
  scope '(:locale)', :locale => /(en|pl)/ do
    devise_for :admin

    scope :admin, :as => :admin do
      get '/', :to => 'admin#index'
      get '/appointments', :to => 'admin#appointments'
      get '/doctors', :to => 'admin#doctors'
      get '/admins', :to => 'admin#admins'
    end

    get '/about', :to => 'home#about_us'
    get '/contact', :to => 'home#contact_us'
    post '/appointment', :to => 'home#appointment'

    root 'home#index'
  end
end
