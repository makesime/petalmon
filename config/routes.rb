Rails.application.routes.draw do
  resources :pokemons, only: [:create, :index, :update, :destroy]
end
