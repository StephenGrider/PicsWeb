defmodule PicsWeb.UserSocket do
  use Phoenix.Socket
  use Guardian.Phoenix.Socket

  ## Channels
  channel "images:*", PicsWeb.RoomChannel

  transport :websocket, Phoenix.Transports.WebSocket

  def connect(_params, socket) do
    :error
  end

  def id(_socket), do: nil
end
