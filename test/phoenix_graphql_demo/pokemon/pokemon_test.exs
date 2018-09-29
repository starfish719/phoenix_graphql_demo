defmodule PhoenixGraphqlDemo.PokemonTest do
  use PhoenixGraphqlDemo.DataCase

  alias PhoenixGraphqlDemo.Pokemon

  describe "pokemons" do
    alias PhoenixGraphqlDemo.Pokemon.PokemonData

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def pokemon_data_fixture(attrs \\ %{}) do
      {:ok, pokemon_data} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pokemon.create_pokemon_data()

      pokemon_data
    end

    test "list_pokemons/0 returns all pokemons" do
      pokemon_data = pokemon_data_fixture()
      assert Pokemon.list_pokemons() == [pokemon_data]
    end

    test "get_pokemon_data!/1 returns the pokemon_data with given id" do
      pokemon_data = pokemon_data_fixture()
      assert Pokemon.get_pokemon_data!(pokemon_data.id) == pokemon_data
    end

    test "create_pokemon_data/1 with valid data creates a pokemon_data" do
      assert {:ok, %PokemonData{} = pokemon_data} = Pokemon.create_pokemon_data(@valid_attrs)
      assert pokemon_data.name == "some name"
    end

    test "create_pokemon_data/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pokemon.create_pokemon_data(@invalid_attrs)
    end

    test "update_pokemon_data/2 with valid data updates the pokemon_data" do
      pokemon_data = pokemon_data_fixture()
      assert {:ok, pokemon_data} = Pokemon.update_pokemon_data(pokemon_data, @update_attrs)
      assert %PokemonData{} = pokemon_data
      assert pokemon_data.name == "some updated name"
    end

    test "update_pokemon_data/2 with invalid data returns error changeset" do
      pokemon_data = pokemon_data_fixture()
      assert {:error, %Ecto.Changeset{}} = Pokemon.update_pokemon_data(pokemon_data, @invalid_attrs)
      assert pokemon_data == Pokemon.get_pokemon_data!(pokemon_data.id)
    end

    test "delete_pokemon_data/1 deletes the pokemon_data" do
      pokemon_data = pokemon_data_fixture()
      assert {:ok, %PokemonData{}} = Pokemon.delete_pokemon_data(pokemon_data)
      assert_raise Ecto.NoResultsError, fn -> Pokemon.get_pokemon_data!(pokemon_data.id) end
    end

    test "change_pokemon_data/1 returns a pokemon_data changeset" do
      pokemon_data = pokemon_data_fixture()
      assert %Ecto.Changeset{} = Pokemon.change_pokemon_data(pokemon_data)
    end
  end

  describe "types" do
    alias PhoenixGraphqlDemo.Pokemon.Type

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def type_fixture(attrs \\ %{}) do
      {:ok, type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pokemon.create_type()

      type
    end

    test "list_types/0 returns all types" do
      type = type_fixture()
      assert Pokemon.list_types() == [type]
    end

    test "get_type!/1 returns the type with given id" do
      type = type_fixture()
      assert Pokemon.get_type!(type.id) == type
    end

    test "create_type/1 with valid data creates a type" do
      assert {:ok, %Type{} = type} = Pokemon.create_type(@valid_attrs)
      assert type.name == "some name"
    end

    test "create_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pokemon.create_type(@invalid_attrs)
    end

    test "update_type/2 with valid data updates the type" do
      type = type_fixture()
      assert {:ok, type} = Pokemon.update_type(type, @update_attrs)
      assert %Type{} = type
      assert type.name == "some updated name"
    end

    test "update_type/2 with invalid data returns error changeset" do
      type = type_fixture()
      assert {:error, %Ecto.Changeset{}} = Pokemon.update_type(type, @invalid_attrs)
      assert type == Pokemon.get_type!(type.id)
    end

    test "delete_type/1 deletes the type" do
      type = type_fixture()
      assert {:ok, %Type{}} = Pokemon.delete_type(type)
      assert_raise Ecto.NoResultsError, fn -> Pokemon.get_type!(type.id) end
    end

    test "change_type/1 returns a type changeset" do
      type = type_fixture()
      assert %Ecto.Changeset{} = Pokemon.change_type(type)
    end
  end
end
