DiamondClinic::Application.routes.draw do
  scope '(:locale)', :locale => /(en|pl)/ do
    get '/about', :to => 'home#about_us'
    get '/contact', :to => 'home#contact_us'
    root 'home#index'
  end
end
