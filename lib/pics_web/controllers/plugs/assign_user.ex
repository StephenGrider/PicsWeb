defmodule PicsWeb.Plugs.AssignUser do
  import Plug.Conn
  import Phoenix.Controller

  def init(_params) do
  end

  def call(conn, _params) do
    case Guardian.Plug.current_resource(conn) do
      user -> assign(conn, :user, user)
      nil -> conn
    end
  end
end
