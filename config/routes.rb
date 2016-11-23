Rails.application.routes.draw do
  resources :things
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'

  scope module: "admin", path: "/admin" do
    resources :options
    resources :people
  end

  get 'opting_in/:access_token', to: 'opt_in#index', as: 'opt_in_template'
  post 'opting_in', to: 'opt_in#create', as: 'i_want_in'
  get 'opted_in/:access_token', to: 'opt_in#you_are_in', as: 'you_are_in'
  get 'expired/:access_token', to: 'opt_in#expired', as: 'expired'
end
