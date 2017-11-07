defmodule Broadcast.Alert.Broadcast do
  use Ecto.Schema
  import Ecto.Changeset
  alias Broadcast.Alert.Broadcast


  schema "broadcasts" do
    field :desc, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Broadcast{} = broadcast, attrs) do
    broadcast
    |> cast(attrs, [:desc])
    |> validate_required([:desc])
  end
end
