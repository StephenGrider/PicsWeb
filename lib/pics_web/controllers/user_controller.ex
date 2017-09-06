defmodule PicsWeb.UserController do
  use PicsWeb, :controller

  alias Pics.Accounts
  alias Pics.Accounts.User

  plug Ueberauth

  def logout(conn, _params) do
    Guardian.Plug.sign_out(conn)
    |> put_flash(:info, "Logged out successfully.")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    github_token = auth.credentials.token
    github_id = auth.uid

    case Accounts.insert_or_update_user(github_id, github_token) do
      {:ok, user} -> conn
        |> Guardian.Plug.sign_in(user)
        |> put_flash(:info, "Logged in!")
        |> redirect(to: "/")
      {:error, _reason} -> redirect(conn, to: "/")
    end
  end

  def callback(%{assigns: %{ueberauth_failure: fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Failed to authenticate.")
    |> redirect(to: "/")
  end
end
