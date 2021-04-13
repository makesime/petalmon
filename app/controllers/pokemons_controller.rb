class PokemonsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    pokemon = Pokemon.new pokemon_params

    return render json: { status: "error", message: pokemon.errors.messages } unless pokemon.save

    render json: pokemon, status: :ok
  end

  def index

  end

  def update

  end

  def delete

  end

  private

  def pokemon_params
    params.require(:pokemon)
          .permit(:name, :type_1, :type_2, :total, :hp, :attack, :defense, :special_attack,
                  :special_defense, :speed, :generation, :legendary)
  end
end
