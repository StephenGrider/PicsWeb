# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pics,
  ecto_repos: [Pics.Repo]

# Configures the endpoint
config :pics, PicsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4a0Tk9i8vbq13x66fvGys4L4zlsvAYOOC8n0kS2d8XGUqu7op+Z3BDwQHl0994zO",
  render_errors: [view: PicsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pics.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "9239f35642a875b098aa",
  client_secret: "fbfacf2758ec121ddaa3931d7bc1ba1b4441fc5d"

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, [default_scope: ""]}
  ]

config :guardian, Guardian,
  issuer: "imgur",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true, # optional
  secret_key: "5HSWEGnt3PxVXKWjfdMWW9HUGm22Elu4yZomtA3QrPPoa7cewSezH2TFEW1njm/N",
  serializer: Pics.Accounts.GuardianSerializer

# AWS keys published on purpose.
config :ex_aws,
  access_key_id: ["AKIAIFQODAS3UOUSNPUQ", :instance_role],
  secret_access_key: ["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", :instance_role],
  region: "us-west-2"
