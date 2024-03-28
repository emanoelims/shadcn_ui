import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :shadcn_ui, ShadcnUI.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "shadcn_ui_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :shadcn_ui, ShadcnUIWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "9yosIdTl/vfkxiet2JA75m8ozqPzsOmjQX0PEfwoYPlUJNZoJn2rpynUlEO1Q98Z",
  server: false

# In test we don't send emails.
config :shadcn_ui, ShadcnUI.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
