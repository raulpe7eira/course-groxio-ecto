defmodule Tome.Library.BookQuery do
  import Ecto.Query, only: [from: 2]

  alias Tome.Feedback.Rating
  alias Tome.Library.Book

  @default_rating_recency 14 * 24 * 60 * 60

  def new do
    from(b in Book,
      where: b.status != "deleted"
    )
  end

  def published(query) do
    from(b in query,
      where: b.status == "published"
    )
  end

  def beta(query) do
    from(b in query,
      where: b.status == "beta"
    )
  end

  def recent(query, date \\ Date.add(Date.utc_today(), -14)) do
    from(b in query,
      where: b.published_on <= ^date
    )
  end

  def as_title_tuples(query) do
    from(b in query,
      select: {b.id, b.title},
      order_by: [asc: b.title]
    )
  end

  def with_ratings(query) do
    from(b in query,
      join: r in Rating,
      on: b.id == r.book_id,
      as: :ratings
    )
  end

  def highly_rated(query, rating \\ 4) do
    from(b in query,
      where: as(:ratings).stars >= ^rating
    )
  end

  def recently_rated(query, date \\ ago(@default_rating_recency)) do
    from(b in query,
      where: as(:ratings).inserted_at >= ^date
    )
  end

  defp ago(seconds_ago) do
    DateTime.add(DateTime.utc_now(), -1 * seconds_ago)
  end
end
