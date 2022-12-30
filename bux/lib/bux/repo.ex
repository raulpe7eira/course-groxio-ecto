defmodule Bux.Repo do
  use Ecto.Repo,
    otp_app: :bux,
    adapter: Ecto.Adapters.Postgres
end
