defmodule PhoenixGraphqlDemoWeb.PokemonResolver do
  alias PhoenixGraphqlDemo.Pokemon

  def pokemon(_root, %{id: id}, _info) do
    case Pokemon.get_pokemon!(id) do
      nil -> 
        {:error, "Pokemon Not Found"}
      pokemon ->
        {:ok, pokemon}
    end
  end

  def all_pokemons(_root, _args, _info) do
    pokemons = Pokemon.list_pokemons()
    {:ok, pokemons}
  end
end