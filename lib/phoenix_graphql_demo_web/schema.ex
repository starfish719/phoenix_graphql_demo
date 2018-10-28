defmodule PhoenixGraphqlDemoWeb.Schema do
  use Absinthe.Schema

  alias PhoenixGraphqlDemoWeb.PokemonResolver
  alias PhoenixGraphqlDemoWeb.TrainedPokemonResolver
 
  object :pokemon do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :type1, :type
    field :type2, :type
    field :base_stats_h, :integer
    field :base_stats_a, :integer
    field :base_stats_b, :integer
    field :base_stats_c, :integer
    field :base_stats_d, :integer
    field :base_stats_s, :integer
  end

  object :type do
    field :id, non_null(:id)
    field :name, non_null(:string)
  end

  object :trained_pokemon do
    field :id, non_null(:id)
    field :pokemon_data, non_null(:pokemon)
    field :nickname, :string
  end

  query do
    field :pokemon, :pokemon do
      arg :id, non_null(:id)
      resolve &PokemonResolver.pokemon/3
    end
    field :all_pokemons, :pokemon|>non_null|>list_of|>non_null do
      resolve &PokemonResolver.all_pokemons/3
    end
    field :trained_pokemon, :trained_pokemon do
      arg :id, non_null(:id)
      resolve &TrainedPokemonResolver.trained_pokemon/3
    end
    field :all_trained_pokemons, :trained_pokemon|>non_null|>list_of|>non_null do
      resolve &TrainedPokemonResolver.all_trained_pokemons/3
    end

    field :type, :type do
      arg :id, non_null(:id)
      resolve &PokemonResolver.type/3
    end
    field :all_types, :type|>non_null|>list_of|>non_null do
      resolve &PokemonResolver.all_types/3
    end
  end

  mutation do
    field :create_trained_pokemon, :trained_pokemon do
      arg :pokemon_id, non_null(:id)
      arg :nickname, :string

      resolve &TrainedPokemonResolver.create_trained_pokemon/3
    end

    field :update_trained_pokemon, :trained_pokemon do
      arg :id, non_null(:id)
      arg :nickname, :string

      resolve &TrainedPokemonResolver.update_trained_pokemon/3
    end
  end
end