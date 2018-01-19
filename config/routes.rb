Rails.application.routes.draw do


  devise_for :users, controllers: { session: "users/sessions", registration: "users/registration" }
  resources :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'proposals#index'
  get 'welcome/index'

  resources :proposals, except: [:index] do
    member {
      get :mark_requeriment
    }

    collection {
      post :search, to:'proposals#index'
      get  :search, to:'proposals#index'
      get :select_type
    }

  end

  resources :sap_code

  resources :activities
end
