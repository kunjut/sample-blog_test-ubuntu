Rails.application.routes.draw do

  get 'home/index'
  get '/terms', to: 'terms#show'
  get '/about', to: 'about#show'
  resource :contacts, only: [:new, :create], path_names: { :new => '' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
