defmodule Pics.Repo.Migrations.AddImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :path, :string
      add :user_id, references(:users)

      timestamps()
    end
  end
end
