Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'welcome#index'

  get 'welcome/index'

  resources :proposals do
    member {
      get :mark_requeriment
    }

    collection {
      post :search, to:'proposals#index'
      get  :search, to:'proposals#index'
      get :select_type
    }

  end

  resources :activities do

  end

end
