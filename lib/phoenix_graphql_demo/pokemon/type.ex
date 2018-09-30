defmodule PhoenixGraphqlDemo.Pokemon.Type do
  use Ecto.Schema
  import Ecto.Changeset

  PhoenixGraphqlDemo.Pokemon.PokemonData

  schema "types" do
    field :name, :string

    timestamps()

    has_many :pokemon_data, PokemonData
  end

  @doc false
  def changeset(type, attrs) do
    type
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
