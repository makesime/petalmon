# The Pokemon Controller is responsible for CRUD actions
class PokemonsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    pokemon = Pokemon.new pokemon_params
    return render json: { status: "error", message: pokemon.errors.messages } unless pokemon.save

    render json: pokemon, status: :ok
  end

  # Returns a paginated pokemon list
  # default_per_page = 25
  def index
    pokemons = Pokemon.order(:id).page(params[:page]).per(params[:per_page])

    render json: pokemons
  end

  def update
    pokemon = Pokemon.find(params[:id])
    pokemon.update(pokemon_params)

    render json: pokemon, status: :ok
  end

  def destroy
    pokemon = Pokemon.find(params[:id])

    pokemon.destroy
  end

  private

  def pokemon_params
    params.require(:pokemon)
          .permit(:name, :type_1, :type_2, :total, :hp, :attack, :defense, :special_attack,
                  :special_defense, :speed, :generation, :legendary)
  end
end
