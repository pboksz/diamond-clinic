DiamondClinic::Application.routes.draw do
  scope '(:locale)', :locale => /(en|pl)/ do
    devise_for :admin

    get '/about', :to => 'home#about_us'
    get '/contact', :to => 'home#contact_us'
    post '/appointment', :to => 'home#appointment'

    root 'home#index'
  end
end
