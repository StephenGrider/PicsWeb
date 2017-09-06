defmodule Pics.Accounts.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias Pics.Repo
  alias Pics.Accounts.User

  def for_token(user = %User{}) do
    { :ok, "User:#{user.id}" }
  end

  def from_token("User:" <> id) do
    { :ok, Repo.get(User, id) }
  end
end
