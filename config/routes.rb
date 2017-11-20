Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'welcome#index'

  get 'welcome/index'

  resources :proposals do
    get 'select_type', on: :collection
  end

  resources :activities do

  end

end
