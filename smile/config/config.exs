import Config

config :smile, Smile.Repo,
  database: "smile_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :smile, ecto_repos: [Smile.Repo]
