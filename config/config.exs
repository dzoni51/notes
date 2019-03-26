# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :beleske,
  ecto_repos: [Beleske.Repo]

# Configures the endpoint
config :beleske, BeleskeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "25G5qfmP3yeJ1y3l111wAkeN+ui7Tx1132WYf4hniSkuLV0CDmuSbjWn7H2va3UZ",
  render_errors: [view: BeleskeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Beleske.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :arc,
  storage: Arc.Storage.Local
config :phoenix, :template_engines,
  md: PhoenixMarkdown.Engine
