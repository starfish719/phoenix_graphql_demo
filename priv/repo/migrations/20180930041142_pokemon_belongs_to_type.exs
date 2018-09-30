defmodule PhoenixGraphqlDemo.Repo.Migrations.PokemonBelongsToType do
  use Ecto.Migration

  def change do
    alter table(:pokemons) do
      add :type1_id, references(:types)
      add :type2_id, references(:types)
    end
  end
end
