defmodule Smile.Repo do
  use Ecto.Repo,
    otp_app: :smile,
    adapter: Ecto.Adapters.Postgres
end
