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

alias PhoenixGraphqlDemo.Pokemon.PokemonData
init_pokemons = [
  [
    {:name, "フシギダネ"}
  ],
  [
    {:name, "フシギソウ"}
  ],
  [
    {:name, "フシギバナ"}
  ],
]
for init_pokemon <- init_pokemons do
  Repo.insert!(
    %PokemonData{
      name: init_pokemon[:name]
    }
  )
end

alias PhoenixGraphqlDemo.Pokemon.Type
init_types = [
  [
    {:name, "ノーマル"}
  ],
  [
    {:name, "ほのお"}
  ],
  [
    {:name, "みず"}
  ],
  [
    {:name, "くさ"}
  ],
  [
    {:name, "でんき"}
  ],
  [
    {:name, "いわ"}
  ],
  [
    {:name, "じめん"}
  ],
  [
    {:name, "こおり"}
  ],
  [
    {:name, "どく"}
  ],
  [
    {:name, "エスパー"}
  ],
  [
    {:name, "かくとう"}
  ],
  [
    {:name, "ひこう"}
  ],
  [
    {:name, "むし"}
  ],
  [
    {:name, "ゴースト"}
  ],
  [
    {:name, "ドラゴン"}
  ],
  [
    {:name, "あく"}
  ],
  [
    {:name, "はがね"}
  ],
  [
    {:name, "フェアリー"}
  ],
]

for init_type <- init_types do
  Repo.insert!(
    %Type{
      name: init_type[:name]
    }
  )
end