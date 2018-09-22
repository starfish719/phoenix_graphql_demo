defmodule PhoenixGraphqlDemoWeb.PokemonResolver do
  alias PhoenixGraphqlDemo.Pokemon

  def all_pokemons(_root, _args, _info) do
    pokemons = Pokemon.list_pokemons()
    {:ok, pokemons}
  end
end