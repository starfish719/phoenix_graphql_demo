defmodule PhoenixGraphqlDemo.TrainedPokemon do
  @moduledoc """
  The TrainedPokemon context.
  """

  import Ecto.Query, warn: false
  alias PhoenixGraphqlDemo.Repo

  alias PhoenixGraphqlDemo.Pokemon.PokemonData
  alias PhoenixGraphqlDemo.TrainedPokemon.TrainedPokemonData

  @doc """
  Returns the list of trained_pokemons.

  ## Examples

      iex> list_trained_pokemons()
      [%TrainedPokemonData{}, ...]

  """
  def list_trained_pokemons do
    Repo.all(TrainedPokemonData)
      |>Repo.preload(:pokemon_data)
      |>Repo.preload(pokemon_data: :type1)
      |>Repo.preload(pokemon_data: :type2)
  end

  @doc """
  Gets a single trained_pokemon_data.

  Raises `Ecto.NoResultsError` if the Trained pokemon data does not exist.

  ## Examples

      iex> get_trained_pokemon_data!(123)
      %TrainedPokemonData{}

      iex> get_trained_pokemon_data!(456)
      ** (Ecto.NoResultsError)

  """
  def get_trained_pokemon_data!(id) do
    Repo.get!(TrainedPokemonData, id)
      |>Repo.preload(:pokemon_data)
      |>Repo.preload(pokemon_data: :type1)
      |>Repo.preload(pokemon_data: :type2)
  end

  @doc """
  Creates a trained_pokemon_data.

  ## Examples

      iex> create_trained_pokemon_data(%{field: value})
      {:ok, %TrainedPokemonData{}}

      iex> create_trained_pokemon_data(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_trained_pokemon_data(attrs \\ %{}) do
    %TrainedPokemonData{}
    |> TrainedPokemonData.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a trained_pokemon_data.

  ## Examples

      iex> update_trained_pokemon_data(trained_pokemon_data, %{field: new_value})
      {:ok, %TrainedPokemonData{}}

      iex> update_trained_pokemon_data(trained_pokemon_data, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_trained_pokemon_data(%TrainedPokemonData{} = trained_pokemon_data, attrs) do
    trained_pokemon_data
    |> TrainedPokemonData.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a TrainedPokemonData.

  ## Examples

      iex> delete_trained_pokemon_data(trained_pokemon_data)
      {:ok, %TrainedPokemonData{}}

      iex> delete_trained_pokemon_data(trained_pokemon_data)
      {:error, %Ecto.Changeset{}}

  """
  def delete_trained_pokemon_data(%TrainedPokemonData{} = trained_pokemon_data) do
    Repo.delete(trained_pokemon_data)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking trained_pokemon_data changes.

  ## Examples

      iex> change_trained_pokemon_data(trained_pokemon_data)
      %Ecto.Changeset{source: %TrainedPokemonData{}}

  """
  def change_trained_pokemon_data(%TrainedPokemonData{} = trained_pokemon_data) do
    TrainedPokemonData.changeset(trained_pokemon_data, %{})
  end
end
