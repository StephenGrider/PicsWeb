defmodule PicsWeb.RoomChannel do
  use Phoenix.Channel

  alias Pics.Uploads

  def join("images:all", _message, socket) do
    {:ok, Uploads.list_images(), socket}
  end
end
