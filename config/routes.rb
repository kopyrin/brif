Brif::Application.routes.draw do
  resources :matters

  resources :information

  resources :projects

  root :to => "projects#index"
  devise_for :users
  resources :users, :only => [:show, :index]

  match '/select_information',  :to => 'information#select_information'
  match '/toprn',  :to => 'matters#toprn'
end
