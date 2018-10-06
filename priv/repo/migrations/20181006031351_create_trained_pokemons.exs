defmodule PhoenixGraphqlDemo.Repo.Migrations.CreateTrainedPokemons do
  use Ecto.Migration

  def change do
    create table(:trained_pokemons) do
      add :pokemon_id, references(:pokemons)
      add :nickname, :string

      timestamps()
    end

  end
end
