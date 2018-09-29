defmodule PhoenixGraphqlDemoWeb.Schema do
  use Absinthe.Schema

  alias PhoenixGraphqlDemoWeb.PokemonResolver

  object :pokemon do
    field :id, non_null(:id)
    field :name, non_null(:string)
  end

  object :type do
    field :id, non_null(:id)
    field :name, non_null(:string)
  end

  query do
    field :pokemon, :pokemon do
      arg :id, non_null(:id)
      resolve &PokemonResolver.pokemon/3
    end
    field :all_pokemons, non_null(list_of(non_null(:pokemon))) do
      resolve &PokemonResolver.all_pokemons/3
    end

    field :type, :type do
      arg :id, non_null(:id)
      resolve &PokemonResolver.type/3
    end
    field :all_types, non_null(list_of(non_null(:type))) do
      resolve &PokemonResolver.all_types/3
    end
  end
end