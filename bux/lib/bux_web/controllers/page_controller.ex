defmodule BuxWeb.PageController do
  use BuxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
