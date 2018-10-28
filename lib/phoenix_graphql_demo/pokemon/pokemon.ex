defmodule PhoenixGraphqlDemo.Pokemon do
  @moduledoc """
  The Pokemon context.
  """

  import Ecto.Query, warn: false
  alias PhoenixGraphqlDemo.Repo

  alias PhoenixGraphqlDemo.Pokemon.PokemonData

  @doc """
  Returns the list of pokemons.

  ## Examples

      iex> list_pokemons()
      [%PokemonData{}, ...]

  """
  def list_pokemons do
    Repo.all(PokemonData)
    |>Repo.preload(:type1)
    |>Repo.preload(:type2)
  end

  @doc """
  Gets a single pokemon.

  Raises `Ecto.NoResultsError` if the Pokemon list does not exist.

  ## Examples

      iex> get_pokemon!(123)
      %PokemonData{}

      iex> get_pokemon!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pokemon_data!(id) do
    Repo.get!(PokemonData, id)
    |>Repo.preload(:type1)
    |>Repo.preload(:type2)
  end

  @doc """
  Creates a pokemon_data.

  ## Examples

      iex> create_pokemon_data(%{field: value})
      {:ok, %PokemonData{}}

      iex> create_pokemon_data(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pokemon_data(attrs \\ %{}) do
    %PokemonData{}
    |> PokemonData.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pokemon_data.

  ## Examples

      iex> update_pokemon_data(pokemon_data, %{field: new_value})
      {:ok, %PokemonData{}}

      iex> update_pokemon_data(pokemon_data, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pokemon_data(%PokemonData{} = pokemon_data, attrs) do
    pokemon_data
    |> PokemonData.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PokemonData.

  ## Examples

      iex> delete_pokemon_data(pokemon_data)
      {:ok, %PokemonData{}}

      iex> delete_pokemon_data(pokemon_data)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pokemon_data(%PokemonData{} = pokemon_data) do
    Repo.delete(pokemon_data)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pokemon_data changes.

  ## Examples

      iex> change_pokemon_data(pokemon_data)
      %Ecto.Changeset{source: %PokemonData{}}

  """
  def change_pokemon_data(%PokemonData{} = pokemon_data) do
    PokemonData.changeset(pokemon_data, %{})
  end

  alias PhoenixGraphqlDemo.Pokemon.Type

  @doc """
  Returns the list of types.

  ## Examples

      iex> list_types()
      [%Type{}, ...]

  """
  def list_types do
    Repo.all(Type)
  end

  @doc """
  Gets a single type.

  Raises `Ecto.NoResultsError` if the Type does not exist.

  ## Examples

      iex> get_type!(123)
      %Type{}

      iex> get_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_type!(id), do: Repo.get!(Type, id)

  @doc """
  Creates a type.

  ## Examples

      iex> create_type(%{field: value})
      {:ok, %Type{}}

      iex> create_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_type(attrs \\ %{}) do
    %Type{}
    |> Type.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a type.

  ## Examples

      iex> update_type(type, %{field: new_value})
      {:ok, %Type{}}

      iex> update_type(type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_type(%Type{} = type, attrs) do
    type
    |> Type.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Type.

  ## Examples

      iex> delete_type(type)
      {:ok, %Type{}}

      iex> delete_type(type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_type(%Type{} = type) do
    Repo.delete(type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking type changes.

  ## Examples

      iex> change_type(type)
      %Ecto.Changeset{source: %Type{}}

  """
  def change_type(%Type{} = type) do
    Type.changeset(type, %{})
  end
end
