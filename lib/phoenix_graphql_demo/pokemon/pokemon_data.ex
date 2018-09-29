defmodule PhoenixGraphqlDemo.Pokemon.PokemonData do
  use Ecto.Schema
  import Ecto.Changeset


  schema "pokemons" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(pokemon_data, attrs) do
    pokemon_data
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
