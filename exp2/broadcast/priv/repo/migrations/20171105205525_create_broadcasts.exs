defmodule Broadcast.Repo.Migrations.CreateBroadcasts do
  use Ecto.Migration

  def change do
    create table(:broadcasts) do
      add :desc, :string
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:broadcasts, [:user_id])
  end
end
