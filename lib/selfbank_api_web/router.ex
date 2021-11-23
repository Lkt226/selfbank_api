defmodule SelfbankApiWeb.Router do
  use SelfbankApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SelfbankApiWeb do
    pipe_through :api
  end

  scope "/api" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug, schema: SelfbankApiWeb.Schema
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: SelfbankApiWeb.Schema
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/", SelfbankApiWeb do
    pipe_through :browser
    get "/", IndexController, :index
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: SelfbankApiWeb.Telemetry
    end
  end
end
