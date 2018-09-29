defmodule PhoenixGraphqlDemoWeb.PokemonResolver do
  alias PhoenixGraphqlDemo.Pokemon

  def pokemon(_root, %{id: id}, _info) do
    case Pokemon.get_pokemon_data!(id) do
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

  def type(_root, %{id: id}, _info) do
    case Pokemon.get_type!(id) do
      nil -> 
        {:error, "Type Not Fround"}
      type ->
        {:ok, type}
    end
  end

  def all_types(_root, _args, _info) do
    types = Pokemon.list_types()
    {:ok, types}
  end
end