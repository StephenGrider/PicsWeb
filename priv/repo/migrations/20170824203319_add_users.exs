defmodule Pics.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :github_id, :integer
      add :github_token, :string

      timestamps()
    end
  end
end
