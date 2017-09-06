defmodule PicsWeb.PageController do
  use PicsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
