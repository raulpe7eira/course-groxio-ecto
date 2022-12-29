defmodule Tome.Feedback.Rating do
  use Ecto.Schema
  import Ecto.Changeset

  alias Tome.Library.Book

  schema "ratings" do
    field(:stars, :integer)
    belongs_to(:book, Book)

    timestamps()
  end

  def new(book), do: Ecto.build_assoc(book, :ratings)

  def changeset(rating, params \\ %{}) do
    rating
    |> cast(params, [:stars, :book_id])
    |> validate_required([:stars, :book_id])
    |> validate_number(:stars, greater_than: 0, less_than: 6)
  end
end
