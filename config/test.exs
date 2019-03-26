use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :beleske, BeleskeWeb.Endpoint,
  http: [port: 4002],
  server: false
config :arc, storage: Arc.Storage.Local
# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :beleske, Beleske.Repo,
  username: "postgres",
  password: "postgres",
  database: "beleske_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
