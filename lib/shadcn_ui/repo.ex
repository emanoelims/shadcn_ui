defmodule ShadcnUI.Repo do
  use Ecto.Repo,
    otp_app: :shadcn_ui,
    adapter: Ecto.Adapters.Postgres
end
