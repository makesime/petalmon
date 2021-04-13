FactoryBot.define do
  factory :pokemon do
    sequence(:name) { |n| "Pokemon#{n}" }
    type_1 { "Fire" }
    hp { rand(1..125) }
    attack { rand(1..125) }
    defense { rand(1..125) }
    special_attack { rand(1..125) }
    special_defense { rand(1..125) }
    speed { rand(1..125) }
    generation { rand(1..8) }
  end
end