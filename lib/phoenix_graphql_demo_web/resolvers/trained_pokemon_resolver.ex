defmodule PhoenixGraphqlDemoWeb.TrainedPokemonResolver do
  alias PhoenixGraphqlDemo.TrainedPokemon

  def trained_pokemon(_root, %{id: id}, _info) do
    case TrainedPokemon.get_trained_pokemon_data!(id) do
      nil -> 
        {:error, "TrainedPokemon Not Found"}
      trained_pokemon ->
        {:ok, trained_pokemon}
    end
  end

  def all_trained_pokemons(_root, _args, _info) do
    trained_pokemons = TrainedPokemon.list_trained_pokemons()
    {:ok, trained_pokemons}
  end
end