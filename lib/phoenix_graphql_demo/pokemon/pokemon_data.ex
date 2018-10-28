defmodule PhoenixGraphqlDemo.Pokemon.PokemonData do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixGraphqlDemo.Pokemon.Type

  schema "pokemons" do
    field :name, :string
    field :base_stats_h, :integer, default: 0
    field :base_stats_a, :integer, default: 0
    field :base_stats_b, :integer, default: 0
    field :base_stats_c, :integer, default: 0
    field :base_stats_d, :integer, default: 0
    field :base_stats_s, :integer, default: 0

    timestamps()

    belongs_to :type1, Type, foreign_key: :type1_id
    belongs_to :type2, Type, foreign_key: :type2_id
  end

  @doc false
  def changeset(pokemon_data, attrs) do
    pokemon_data
    |> cast(
      attrs,
      [
        :name,
        :type1_id,
        :type2_id,
        :base_stats_h,
        :base_stats_a,
        :base_stats_b,
        :base_stats_c,
        :base_stats_d,
        :base_stats_s
      ]
    )
    |> validate_required(
      [
        :name,
        :type1_id,
        :type2_id,
        :base_stats_h,
        :base_stats_a,
        :base_stats_b,
        :base_stats_c,
        :base_stats_d,
        :base_stats_s
      ]
    )
  end
end
