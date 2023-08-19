Rails.application.routes.draw do


  namespace :app do
    resources :queues
    resources :workspaces
    resources :users
    resources :health_insurances
    resources :professionals
    resources :specializations
    resources :areas
    resources :health_units
  end

  
  root to: "site#index"
  post '/toogle_locale', to: 'site#toogle_locale', as: :toogle_locale
  
  post "/subscribe", to: 'site#subscribe_to_newsletter', as: :subscribe
  get "/unsubscribe", to: 'site#unsubscribe_confirm', as: :unsubscribe_confirm
  post "/unsubscribe", to: 'site#unsubscribe_to_newsletter', as: :unsubscribe
  post "/contact_forms", to: 'site#contact_forms', as: :contact_forms
  
end
