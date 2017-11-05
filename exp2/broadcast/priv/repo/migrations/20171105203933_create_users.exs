defmodule Broadcast.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :isManager?, :boolean, default: false, null: false
      add :isAdmin?, :boolean, default: false, null: false

      timestamps()
    end

  end
end
