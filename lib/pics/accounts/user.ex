defmodule Pics.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pics.Accounts.User

  schema "users" do
    field :github_id, :integer
    field :github_token, :string
    has_many :images, Pics.Uploads.Image

    timestamps()
  end

  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:github_token, :github_id])
    |> validate_required([:github_id, :github_token])
  end
end
