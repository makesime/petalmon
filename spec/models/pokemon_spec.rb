require "rails_helper"

describe Pokemon do
  describe "validations" do
    context "when validating name" do
      it "require presence" do
        pokemon = build_stubbed :pokemon, name: nil

        pokemon.valid?

        expect(pokemon.errors[:name].size).to eq 1
      end
    end

    context "when validating type_1" do
      it "require presence" do
        pokemon = build_stubbed :pokemon, type_1: nil

        pokemon.valid?

        expect(pokemon.errors[:type_1].size).to eq 1
      end
    end

    context "when validating hp" do
      it "require presence" do
        pokemon = build_stubbed :pokemon, hp: nil

        pokemon.valid?

        expect(pokemon.errors[:hp].size).to eq 1
      end
    end

    context "when validating attack" do
      it "require presence" do
        pokemon = build_stubbed :pokemon, attack: nil

        pokemon.valid?

        expect(pokemon.errors[:attack].size).to eq 1
      end
    end

    context "when validating defense" do
      it "require presence" do
        pokemon = build_stubbed :pokemon, defense: nil

        pokemon.valid?

        expect(pokemon.errors[:defense].size).to eq 1
      end
    end

    context "when validating special_attack" do
      it "require presence" do
        pokemon = build_stubbed :pokemon, special_attack: nil

        pokemon.valid?

        expect(pokemon.errors[:special_attack].size).to eq 1
      end
    end

    context "when validating special_defense" do
      it "require presence" do
        pokemon = build_stubbed :pokemon, special_defense: nil

        pokemon.valid?

        expect(pokemon.errors[:special_defense].size).to eq 1
      end
    end

    context "when validating speed" do
      it "require presence" do
        pokemon = build_stubbed :pokemon, speed: nil

        pokemon.valid?

        expect(pokemon.errors[:speed].size).to eq 1
      end
    end

    context "when validating generation" do
      it "require presence" do
        pokemon = build_stubbed :pokemon, generation: nil

        pokemon.valid?

        expect(pokemon.errors[:generation].size).to eq 1
      end
    end
  end
end
