defmodule Pics.Accounts do
  import Ecto.Query, warn: false

  alias Pics.Repo
  alias Pics.Accounts.User

  def insert_or_update_user(github_id, github_token) do
    user_params = %{github_id: github_id, github_token: github_token}
    changeset = User.changeset(%User{}, user_params)

    case Repo.get_by(User, github_id: github_id) do
      nil ->
        Repo.insert(changeset)
      user ->
        {:ok, user}
    end
  end
end
