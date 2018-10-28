defmodule PhoenixGraphqlDemo.Repo.Migrations.RenameBaseStats do
  use Ecto.Migration

  def change do
    rename table(:pokemons), :individual_value_h, to: :base_stats_h
    rename table(:pokemons), :individual_value_a, to: :base_stats_a
    rename table(:pokemons), :individual_value_b, to: :base_stats_b
    rename table(:pokemons), :individual_value_c, to: :base_stats_c
    rename table(:pokemons), :individual_value_d, to: :base_stats_d
    rename table(:pokemons), :individual_value_s, to: :base_stats_s
  end
end
