# Petalmon: A Pokemon Ruby on Rails App

This is a basic Ruby on Rails app made for PetalMD

## Overview
Project is created with:
* Ruby 3.0.0
* Rails 6.1.3.1
## Installation
To install the app, you must run:
```
bundle install
```
When installation is complete, you can start the server
```
rails s
```

To build a database seeded by [pokemon.csv](https://gist.github.com/armgilles/194bcff35001e7eb53a2a8b441e8b2c6), simply run:
```
rake db:reset
```

## Test suite
* Test suite is using the RSpec testing framework, to run the test suite:
```
rspec spec
```

## API
CRUD action are available in [pokemons_controller.rb](https://github.com/makesime/petalmon/blob/master/app/controllers/pokemons_controller.rb)

### POST `/pokemons`
Params must be provided in a `pokemon` JSON object.
Accepted parameters:
- name: mandatory
- type_1: mandatory
- type_2: optional
- total: optional
- hp: mandatory
- attack: mandatory
- defense: mandatory
- special_attack: mandatory
- special_defense: mandatory
- speed: mandatory
- generation: mandatory
- legendary: optional

Request body example:

```
{
  "pokemon": {
      "name": "Mowgli",
      "type_1": "Fire",
      "hp": 40,
      "attack": 50,
      "defense": 98,
      "special_attack": 46,
      "special_defense": 102,
      "speed": 12,
      "generation": 2
  }
}
```

### GET `/pokemons`
By default, will return the 25 first elements.

Accepted parameters:
- page: optional
- per_page: optional


### PUT `/pokemons/:id`
Params must be provided in a `pokemon` JSON object.
Accepted parameters: `[:name, :type_1, :type_2, :total, :hp, :attack, :defense, :specia_attack, :special_defense, :speed, :generation, :legendary]`

Request body example:
```
{
  "pokemon": {
      "name": "Mowgli"
  }
}
```

### DELETE `/pokemons/:id`
