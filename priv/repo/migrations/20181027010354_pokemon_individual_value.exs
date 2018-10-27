defmodule PhoenixGraphqlDemo.Repo.Migrations.PokemonIndividualValue do
  use Ecto.Migration

  def change do
    alter table(:pokemons) do
      add :individual_value_h, :integer, default: 0
      add :individual_value_a, :integer, default: 0
      add :individual_value_b, :integer, default: 0
      add :individual_value_c, :integer, default: 0
      add :individual_value_d, :integer, default: 0
      add :individual_value_s, :integer, default: 0
    end
  end
end
