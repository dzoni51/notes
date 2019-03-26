defmodule Beleske.Repo do
  use Ecto.Repo,
    otp_app: :beleske,
    adapter: Ecto.Adapters.Postgres
end
