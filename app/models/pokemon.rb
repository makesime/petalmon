class Pokemon < ApplicationRecord
  validates :name, :type_1, :hp, :attack, :defense, :special_attack,
            :special_defense, :speed, :generation, presence: true
end
