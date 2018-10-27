defmodule PhoenixGraphqlDemo.Pokemon.PokemonData do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixGraphqlDemo.Pokemon.Type

  schema "pokemons" do
    field :name, :string
    field :individual_value_h, :integer, default: 0
    field :individual_value_a, :integer, default: 0
    field :individual_value_b, :integer, default: 0
    field :individual_value_c, :integer, default: 0
    field :individual_value_d, :integer, default: 0
    field :individual_value_s, :integer, default: 0

    timestamps()

    belongs_to :type1, Type, foreign_key: :type1_id
    belongs_to :type2, Type, foreign_key: :type2_id
  end

  @doc false
  def changeset(pokemon_data, attrs) do
    pokemon_data
    |> cast(attrs, [:name, :type1_id, :type2_id, :individual_value_h, :individual_value_a, :individual_value_b, :individual_value_c, :individual_value_d, :individual_value_s])
    |> validate_required([:name, :type1_id, :type2_id, :individual_value_a, :individual_value_b, :individual_value_c, :individual_value_d, :individual_value_s])
  end
end
