defmodule PhoenixGraphqlDemo.Pokemon.PokemonData do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixGraphqlDemo.Pokemon.Type

  schema "pokemons" do
    field :name, :string

    timestamps()

    belongs_to :type1, Type, foreign_key: :type1_id
    belongs_to :type2, Type, foreign_key: :type2_id
  end

  @doc false
  def changeset(pokemon_data, attrs) do
    pokemon_data
    |> cast(attrs, [:name, :type1_id, :type2_id])
    |> validate_required([:name, :type1_id, :type2_id])
  end
end
