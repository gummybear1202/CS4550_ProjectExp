defmodule Broadcast.Account.Team do
  use Ecto.Schema
  import Ecto.Changeset
  alias Broadcast.Account.Team


  schema "teams" do
    field :team_name, :string
    field :manager_id, :id
    field :employee_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Team{} = team, attrs) do
    team
    |> cast(attrs, [:team_name])
    |> validate_required([:team_name])
  end
end
