defmodule PhoenixGraphqlDemo.Pokemon do
  @moduledoc """
  The Pokemon context.
  """

  import Ecto.Query, warn: false
  alias PhoenixGraphqlDemo.Repo

  alias PhoenixGraphqlDemo.Pokemon.PokemonList

  @doc """
  Returns the list of pokemons.

  ## Examples

      iex> list_pokemons()
      [%PokemonList{}, ...]

  """
  def list_pokemons do
    Repo.all(PokemonList)
  end

  @doc """
  Gets a single pokemon.

  Raises `Ecto.NoResultsError` if the Pokemon list does not exist.

  ## Examples

      iex> get_pokemon!(123)
      %PokemonList{}

      iex> get_pokemon!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pokemon!(id), do: Repo.get!(PokemonList, id)

  @doc """
  Creates a pokemon_list.

  ## Examples

      iex> create_pokemon_list(%{field: value})
      {:ok, %PokemonList{}}

      iex> create_pokemon_list(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pokemon_list(attrs \\ %{}) do
    %PokemonList{}
    |> PokemonList.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pokemon_list.

  ## Examples

      iex> update_pokemon_list(pokemon_list, %{field: new_value})
      {:ok, %PokemonList{}}

      iex> update_pokemon_list(pokemon_list, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pokemon_list(%PokemonList{} = pokemon_list, attrs) do
    pokemon_list
    |> PokemonList.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PokemonList.

  ## Examples

      iex> delete_pokemon_list(pokemon_list)
      {:ok, %PokemonList{}}

      iex> delete_pokemon_list(pokemon_list)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pokemon_list(%PokemonList{} = pokemon_list) do
    Repo.delete(pokemon_list)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pokemon_list changes.

  ## Examples

      iex> change_pokemon_list(pokemon_list)
      %Ecto.Changeset{source: %PokemonList{}}

  """
  def change_pokemon_list(%PokemonList{} = pokemon_list) do
    PokemonList.changeset(pokemon_list, %{})
  end
end
