use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_f1_json_api, PhoenixF1JsonApi.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :phoenix_f1_json_api, PhoenixF1JsonApi.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  password: "root",
  database: "phoenix_f1_json_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
