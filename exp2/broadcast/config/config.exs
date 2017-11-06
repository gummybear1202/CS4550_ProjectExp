# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :broadcast,
  ecto_repos: [Broadcast.Repo]

# Configures the endpoint
config :broadcast, BroadcastWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sIOpakSnUrPpDMLpAI2rkINa1VxCJvvvR1eE/uREQ70pC3nO8zu6yjZKDX3nmBiD",
  render_errors: [view: BroadcastWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Broadcast.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
