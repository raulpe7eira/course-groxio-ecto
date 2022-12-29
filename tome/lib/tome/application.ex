defmodule Tome.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Tome.Worker.start_link(arg)
      # {Tome.Worker, arg}
      {Tome.Repo, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tome.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
