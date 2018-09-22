defmodule PhoenixGraphqlDemoWeb.Router do
  use PhoenixGraphqlDemoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixGraphqlDemoWeb do
    pipe_through :api
  end
end
