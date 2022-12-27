defmodule Tome.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :isbn, :string
      add :description, :text
      add :published_on, :date, default: nil
      add :status, :string, default: "published"

      timestamps()
    end
  end

  unique_index("books", [:isbn])
end
