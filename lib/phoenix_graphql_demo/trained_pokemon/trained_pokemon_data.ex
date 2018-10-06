defmodule PhoenixGraphqlDemo.TrainedPokemon.TrainedPokemonData do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixGraphqlDemo.Pokemon.PokemonData

  schema "trained_pokemons" do
    field :nickname, :string

    timestamps()

    belongs_to :pokemon_data, PokemonData, foreign_key: :pokemon_id
  end

  @doc false
  def changeset(trained_pokemon_data, attrs) do
    trained_pokemon_data
    |> cast(attrs, [:nickname, :pokemon_id])
    |> validate_required([:pokemon_id])
  end
end
