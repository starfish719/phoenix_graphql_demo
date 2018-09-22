# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_graphql_demo,
  ecto_repos: [PhoenixGraphqlDemo.Repo]

# Configures the endpoint
config :phoenix_graphql_demo, PhoenixGraphqlDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BpUSrq0YmB6SDvvNdZ7OIAVOn25THTd6FwDRQg/mmlYV4twsvGpwtd9fN6X2UvQo",
  render_errors: [view: PhoenixGraphqlDemoWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: PhoenixGraphqlDemo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
