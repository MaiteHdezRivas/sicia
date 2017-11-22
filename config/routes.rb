Rails.application.routes.draw do

  root 'welcome#index'
  get 'welcome/index'

  devise_for :users, controllers: { session: "users/sessions", registration: "users/registration" }
  resources :users

  resources :proposals do
    get 'select_type', on: :collection
  end

  resources :activities do

  end

end
