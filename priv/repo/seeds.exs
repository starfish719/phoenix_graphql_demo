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

alias PhoenixGraphqlDemo.Pokemon.PokemonList
alias PhoenixGraphqlDemo.Repo
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
    %PokemonList{
      name: init_pokemon[:name]
    }
  )
end 