class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|

      t.string :name
      t.string :type_1
      t.string :type_2
      t.integer :total
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :special_attack
      t.integer :special_defense
      t.integer :speed
      t.integer :generation
      t.boolean :legendary, default: false
    end
  end
end
