# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :selfbank_api,
  ecto_repos: [SelfbankApi.Repo]

config :selfbank_api, SelfbankApi.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :selfbank_api, SelfbankApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "U+SRuFbMlAM9bSKWLk0MCaXVuq8GAYyT0gTtQeRdg9WdLC5a33oSrhj9jakk1QA+",
  render_errors: [view: SelfbankApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: SelfbankApi.PubSub,
  live_view: [signing_salt: "BkMlQnlj"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
