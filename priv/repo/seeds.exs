# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhoenixGraphqlDemo.Repo.insert!(%PhoenixGraphqlDemo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias PhoenixGraphqlDemo.Repo

alias PhoenixGraphqlDemo.Pokemon.Type
init_types = [
  [
    {:id, 1},
    {:name, "ノーマル"}
  ],
  [
    {:id, 2},
    {:name, "ほのお"}
  ],
  [
    {:id, 3},
    {:name, "みず"}
  ],
  [
    {:id, 4},
    {:name, "くさ"}
  ],
  [
    {:id, 5},
    {:name, "でんき"}
  ],
  [
    {:id, 6},
    {:name, "いわ"}
  ],
  [
    {:id, 7},
    {:name, "じめん"}
  ],
  [
    {:id, 8},
    {:name, "こおり"}
  ],
  [
    {:id, 9},
    {:name, "どく"}
  ],
  [
    {:id, 10},
    {:name, "エスパー"}
  ],
  [
    {:id, 11},
    {:name, "かくとう"}
  ],
  [
    {:id, 12},
    {:name, "ひこう"}
  ],
  [
    {:id, 13},
    {:name, "むし"}
  ],
  [
    {:id, 14},
    {:name, "ゴースト"}
  ],
  [
    {:id, 15},
    {:name, "ドラゴン"}
  ],
  [
    {:id, 16},
    {:name, "あく"}
  ],
  [
    {:id, 17},
    {:name, "はがね"}
  ],
  [
    {:id, 18},
    {:name, "フェアリー"}
  ],
]

for init_type <- init_types do
  case Repo.get Type, init_type[:id] do
    nil ->
      Repo.insert!(
        %Type{
          id: init_type[:id],
          name: init_type[:name]
        }
      )
    type ->
      type = Ecto.Changeset.change type, name: init_type[:name]
      Repo.update! type
  end
end

alias PhoenixGraphqlDemo.Pokemon.PokemonData
init_pokemons = [
  [
    {:id, 1},
    {:name, "フシギダネ"},
    {:type1_id, 4},
    {:type2_id, 9}
  ],
  [
    {:id, 2},
    {:name, "フシギソウ"},
    {:type1_id, 4},
    {:type2_id, 9}
  ],
  [
    {:id, 3},
    {:name, "フシギバナ"},
    {:type1_id, 4},
    {:type2_id, 9}
  ],
]
for init_pokemon <- init_pokemons do
  case Repo.get PokemonData, init_pokemon[:id] do
    nil ->
      Repo.insert!(
        %PokemonData{
          id: init_pokemon[:id],
          name: init_pokemon[:name],
          type1_id: init_pokemon[:type1_id],
          type2_id: init_pokemon[:type2_id]
        }
      )
    pokemon ->
      pokemon = Ecto.Changeset.change pokemon, name: init_pokemon[:name], type1_id: init_pokemon[:type1_id], type2_id: init_pokemon[:type2_id]
      Repo.update! pokemon
  end
end

alias PhoenixGraphqlDemo.TrainedPokemon.TrainedPokemonData
init_trained_pokemons = [
  [
    {:id, 1},
    {:pokemon_id, 1},
    {:nickname, "フッシー"},
  ],
  [
    {:id, 2},
    {:pokemon_id, 2},
    {:nickname, nil},
  ],
]
for init_trained_pokemon <- init_trained_pokemons do
  case Repo.get TrainedPokemonData, init_trained_pokemon[:id] do
    nil ->
      Repo.insert!(
        %TrainedPokemonData{
          id: init_trained_pokemon[:id],
          pokemon_id: init_trained_pokemon[:pokemon_id],
          nickname: init_trained_pokemon[:nickname],
        }
      )
    trained_pokemon ->
      trained_pokemon = Ecto.Changeset.change trained_pokemon, pokemon_id: init_trained_pokemon[:pokemon_id], nickname: init_trained_pokemon[:nickname]
      Repo.update! trained_pokemon
  end
end