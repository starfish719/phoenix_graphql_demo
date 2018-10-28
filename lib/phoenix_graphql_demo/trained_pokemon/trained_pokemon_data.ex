defmodule PhoenixGraphqlDemo.TrainedPokemon.TrainedPokemonData do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixGraphqlDemo.Pokemon.PokemonData

  schema "trained_pokemons" do
    field :nickname, :string
    field :individual_value_h, :integer, default: 0
    field :individual_value_a, :integer, default: 0
    field :individual_value_b, :integer, default: 0
    field :individual_value_c, :integer, default: 0
    field :individual_value_d, :integer, default: 0
    field :individual_value_s, :integer, default: 0

    timestamps()

    belongs_to :pokemon_data, PokemonData, foreign_key: :pokemon_id
  end

  @doc false
  def changeset(trained_pokemon_data, attrs) do
    trained_pokemon_data
    |> cast(
      attrs,
      [
        :nickname,
        :individual_value_h,
        :individual_value_a,
        :individual_value_b,
        :individual_value_c,
        :individual_value_d,
        :individual_value_s,
        :pokemon_id
      ]
    )
    |> validate_required(
      [
        :individual_value_h,
        :individual_value_a,
        :individual_value_b,
        :individual_value_c,
        :individual_value_d,
        :individual_value_s,
        :pokemon_id
      ]
    )
  end
end
