# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :permission,
  ecto_repos: [Permission.Repo]

# Configures the endpoint
config :permission, PermissionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YQB1rgvNg+3/9isS/rzjAcIZ0G9IZrOlNycO6bO02nElB7+MK+JL1UUwEXGgPT5d",
  render_errors: [view: PermissionWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Permission.PubSub,
           adapter: Phoenix.PubSub.PG2]

# config ueberauth_google
config :ueberauth, Ueberauth,
  providers: [
    google: { Ueberauth.Strategy.Google, [] },
    identity: { Ueberauth.Strategy.Identity, [
        callback_methods: ["POST"],
        uid_field: :username,
        nickname_field: :username,
      ] }
]

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: "113870760288-2vqb75bgh0ckm0sjo9lj8oi2t0eaue3t.apps.googleusercontent.com",
  client_secret: "IzZGBSBy3pmUOhCgtp_v7VCs",
  redirect_uri: "http://localhost:4000/auth/google/callback"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
