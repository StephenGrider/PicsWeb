defmodule Pics.Uploads.Image do
  use Ecto.Schema
  import Ecto.Changeset
  alias Pics.Uploads.Image

  @derive {Poison.Encoder, only: [:path]}

  schema "images" do
    field :path, :string
    belongs_to :user, Pics.Accounts.User

    timestamps()
  end

  def changeset(%Image{} = user, attrs) do
    user
    |> cast(attrs, [:path])
    |> validate_required([:path])
  end
end
