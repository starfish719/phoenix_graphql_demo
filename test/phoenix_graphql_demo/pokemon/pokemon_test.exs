defmodule PhoenixGraphqlDemo.PokemonTest do
  use PhoenixGraphqlDemo.DataCase

  alias PhoenixGraphqlDemo.Pokemon

  describe "pokemons" do
    alias PhoenixGraphqlDemo.Pokemon.PokemonList

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def pokemon_list_fixture(attrs \\ %{}) do
      {:ok, pokemon_list} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pokemon.create_pokemon_list()

      pokemon_list
    end

    test "list_pokemons/0 returns all pokemons" do
      pokemon_list = pokemon_list_fixture()
      assert Pokemon.list_pokemons() == [pokemon_list]
    end

    test "get_pokemon_list!/1 returns the pokemon_list with given id" do
      pokemon_list = pokemon_list_fixture()
      assert Pokemon.get_pokemon_list!(pokemon_list.id) == pokemon_list
    end

    test "create_pokemon_list/1 with valid data creates a pokemon_list" do
      assert {:ok, %PokemonList{} = pokemon_list} = Pokemon.create_pokemon_list(@valid_attrs)
      assert pokemon_list.name == "some name"
    end

    test "create_pokemon_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pokemon.create_pokemon_list(@invalid_attrs)
    end

    test "update_pokemon_list/2 with valid data updates the pokemon_list" do
      pokemon_list = pokemon_list_fixture()
      assert {:ok, pokemon_list} = Pokemon.update_pokemon_list(pokemon_list, @update_attrs)
      assert %PokemonList{} = pokemon_list
      assert pokemon_list.name == "some updated name"
    end

    test "update_pokemon_list/2 with invalid data returns error changeset" do
      pokemon_list = pokemon_list_fixture()
      assert {:error, %Ecto.Changeset{}} = Pokemon.update_pokemon_list(pokemon_list, @invalid_attrs)
      assert pokemon_list == Pokemon.get_pokemon_list!(pokemon_list.id)
    end

    test "delete_pokemon_list/1 deletes the pokemon_list" do
      pokemon_list = pokemon_list_fixture()
      assert {:ok, %PokemonList{}} = Pokemon.delete_pokemon_list(pokemon_list)
      assert_raise Ecto.NoResultsError, fn -> Pokemon.get_pokemon_list!(pokemon_list.id) end
    end

    test "change_pokemon_list/1 returns a pokemon_list changeset" do
      pokemon_list = pokemon_list_fixture()
      assert %Ecto.Changeset{} = Pokemon.change_pokemon_list(pokemon_list)
    end
  end
end
