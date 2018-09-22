defmodule PhoenixGraphqlDemoWeb.Router do
  use PhoenixGraphqlDemoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: PhoenixGraphqlDemoWeb.Schema,
      interface: :simple,
      context: %{pubsub: PhoenixGraphqlDemoWeb.Endpoint}
  end
end
