defmodule PhoenixGraphqlDemoWeb.TrainedPokemonResolver do
  alias PhoenixGraphqlDemo.TrainedPokemon

  def trained_pokemon(_root, %{id: id}, _info) do
    case TrainedPokemon.get_trained_pokemon_data!(id) do
      nil -> 
        {:error, "TrainedPokemon Not Found"}
      pokemon ->
        {:ok, pokemon}
    end
  end

  def all_trained_pokemons(_root, _args, _info) do
    pokemons = TrainedPokemon.list_trained_pokemons()
    {:ok, pokemons}
  end
end