defmodule Tome.Library.Book do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tome.Feedback.Rating

  schema "books" do
    field(:title, :string)
    field(:isbn, :string)
    field(:description)
    field(:published_on, :date, default: nil)
    field(:status, :string, default: "working")

    has_many(:ratings, Rating)

    timestamps()
  end

  def changeset(book, params \\ %{}) do
    book
    |> cast(params, [:title, :isbn, :description, :published_on, :status])
    |> validate_required([:title, :isbn, :status])
    |> validate_inclusion(:status, ~w[working published beta retired])
  end
end
