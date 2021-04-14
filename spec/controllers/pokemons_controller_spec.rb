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
    context "with pagination" do
      it "returns the correct page" do
        pokemons = create_list :pokemon, 3

        get :index, params: { page: 3, per_page: 1 }, format: :json

        expect(@response.parsed_body.pluck("id")).to match_array pokemons.last.id
      end
    end

    context "without pagination" do
      it "returns all pokemons" do
        pokemons = create_list :pokemon, 3

        get :index, format: :json

        expect(@response.parsed_body.size).to eq pokemons.size
      end
    end
  end

  describe "PUT update" do
    context "when pokemon doesn't exists" do
      it { expect { put :update, params: { id: 0 }, format: :json }.to raise_error(ActiveRecord::RecordNotFound) }
    end

    context "when pokemon exists" do
      let(:pokemon) { create :pokemon }

      context "with invalid params" do
        it { expect { put :update, params: { id: pokemon.id }, format: :json }.to raise_error(ActionController::ParameterMissing) }
      end

      context "with valid params" do
        it "updates the pokemon" do
          new_name = "Mowgli"

          put :update, params: { id: pokemon.id, pokemon: { name: new_name } }, format: :json

          expect(@response.parsed_body["name"]).to eq new_name
        end
      end
    end
  end

  describe "DELETE destroy" do
    context "when pokemon doesn't exists" do
      it { expect { delete :destroy, params: { id: 0 }, format: :json }.to raise_error(ActiveRecord::RecordNotFound) }
    end

    context "when pokemon exists" do
      it "deletes the pokemon" do
        pokemon = create :pokemon

        delete :destroy, params: { id: pokemon.id }, format: :json

        expect{ pokemon.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
