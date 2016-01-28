defmodule PhoenixF1JsonApi.PageController do
  use PhoenixF1JsonApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
