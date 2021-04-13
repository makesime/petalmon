require "rails_helper"

describe PokemonsController do
  describe "POST create" do
    context "without pokemon params" do
      it { expect { get :create, format: :json }.to raise_error(ActionController::ParameterMissing) }
    end

    context "with pokemon params" do
      context "with valid params" do
        it "creates a pokemon" do
          pokemon_params = attributes_for :pokemon

          expect { get :create, params: { pokemon: pokemon_params }, format: :json }.to change { Pokemon.count }.by(1)
        end
      end

      context "with unvalid params" do
        it "returns an error" do
          get :create, params: { pokemon: { evolution: "Mowgli" } }, format: :json

          expect(@response.parsed_body["status"]).to eq "error"
        end
      end
    end
  end

  describe "GET index" do

  end
end
