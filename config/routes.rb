Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :players, only: [:show, :index]

  get 'players/:sport', to: 'players#sport_index'
end
