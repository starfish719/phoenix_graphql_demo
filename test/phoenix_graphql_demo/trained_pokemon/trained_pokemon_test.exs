defmodule PhoenixGraphqlDemo.TrainedPokemonTest do
  use PhoenixGraphqlDemo.DataCase

  alias PhoenixGraphqlDemo.TrainedPokemon

  describe "trained_pokemons" do
    alias PhoenixGraphqlDemo.TrainedPokemon.TrainedPokemonData

    @valid_attrs %{nickname: "some nickname"}
    @update_attrs %{nickname: "some updated nickname"}
    @invalid_attrs %{nickname: nil}

    def trained_pokemon_data_fixture(attrs \\ %{}) do
      {:ok, trained_pokemon_data} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TrainedPokemon.create_trained_pokemon_data()

      trained_pokemon_data
    end

    test "list_trained_pokemons/0 returns all trained_pokemons" do
      trained_pokemon_data = trained_pokemon_data_fixture()
      assert TrainedPokemon.list_trained_pokemons() == [trained_pokemon_data]
    end

    test "get_trained_pokemon_data!/1 returns the trained_pokemon_data with given id" do
      trained_pokemon_data = trained_pokemon_data_fixture()
      assert TrainedPokemon.get_trained_pokemon_data!(trained_pokemon_data.id) == trained_pokemon_data
    end

    test "create_trained_pokemon_data/1 with valid data creates a trained_pokemon_data" do
      assert {:ok, %TrainedPokemonData{} = trained_pokemon_data} = TrainedPokemon.create_trained_pokemon_data(@valid_attrs)
      assert trained_pokemon_data.nickname == "some nickname"
    end

    test "create_trained_pokemon_data/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TrainedPokemon.create_trained_pokemon_data(@invalid_attrs)
    end

    test "update_trained_pokemon_data/2 with valid data updates the trained_pokemon_data" do
      trained_pokemon_data = trained_pokemon_data_fixture()
      assert {:ok, trained_pokemon_data} = TrainedPokemon.update_trained_pokemon_data(trained_pokemon_data, @update_attrs)
      assert %TrainedPokemonData{} = trained_pokemon_data
      assert trained_pokemon_data.nickname == "some updated nickname"
    end

    test "update_trained_pokemon_data/2 with invalid data returns error changeset" do
      trained_pokemon_data = trained_pokemon_data_fixture()
      assert {:error, %Ecto.Changeset{}} = TrainedPokemon.update_trained_pokemon_data(trained_pokemon_data, @invalid_attrs)
      assert trained_pokemon_data == TrainedPokemon.get_trained_pokemon_data!(trained_pokemon_data.id)
    end

    test "delete_trained_pokemon_data/1 deletes the trained_pokemon_data" do
      trained_pokemon_data = trained_pokemon_data_fixture()
      assert {:ok, %TrainedPokemonData{}} = TrainedPokemon.delete_trained_pokemon_data(trained_pokemon_data)
      assert_raise Ecto.NoResultsError, fn -> TrainedPokemon.get_trained_pokemon_data!(trained_pokemon_data.id) end
    end

    test "change_trained_pokemon_data/1 returns a trained_pokemon_data changeset" do
      trained_pokemon_data = trained_pokemon_data_fixture()
      assert %Ecto.Changeset{} = TrainedPokemon.change_trained_pokemon_data(trained_pokemon_data)
    end
  end
end
