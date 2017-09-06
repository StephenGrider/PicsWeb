defmodule PicsWeb.ImageController do
  use PicsWeb, :controller

  alias Pics.Uploads

  def index(conn, _params) do
    render conn, "index.html"
  end

  def new(conn, _params) do
    render(conn, "new.html", [])
  end

  def create(conn, %{"file" => params}) do
    {:ok, image} = Uploads.create_image_with_user(params, conn.assigns.user)

    PicsWeb.Endpoint.broadcast("images:all", "new_image", image)

    conn
    |> put_flash(:info, "Image Added!")
    |> redirect(to: "/")
  end
end
