defmodule Smile.Repo.Migrations.CreateEmails do
  use Ecto.Migration

  def change do
    create table(:emails) do
      add :subject, :string
      add :body, :text
      add :recipient, :string
      add :source, :string
    end
  end
end
