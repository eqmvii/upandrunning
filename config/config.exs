# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :upandrunning,
  ecto_repos: [Upandrunning.Repo]

# Configures the endpoint
config :upandrunning, UpandrunningWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pH/7ywfQUH87E3rFg9CMi0OO6br9/TGQVMoJNx1V6Xs/kHAMePNEzApvosHf1HhL",
  render_errors: [view: UpandrunningWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Upandrunning.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
