defmodule Broadcast.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :team_name, :string
      add :manager_id, references(:users, on_delete: :delete_all)
      add :employee_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:teams, [:manager_id])
    create index(:teams, [:employee_id])
  end
end
