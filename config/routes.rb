Rails.application.routes.draw do
  resources :things
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'

  scope module: "admin", path: "/admin" do
    resources :options
    resources :people
  end
end
