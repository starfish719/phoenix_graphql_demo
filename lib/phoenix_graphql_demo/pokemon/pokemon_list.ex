defmodule PhoenixGraphqlDemo.Pokemon.PokemonList do
  use Ecto.Schema
  import Ecto.Changeset


  schema "pokemons" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(pokemon_list, attrs) do
    pokemon_list
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
