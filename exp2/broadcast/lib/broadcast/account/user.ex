defmodule Broadcast.Account.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Broadcast.Account.User


  schema "users" do
    field :email, :string
    field :first_name, :string
    field :isAdmin?, :boolean, default: false
    field :isManager?, :boolean, default: false
    field :last_name, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :isManager?, :isAdmin?])
    |> validate_required([:first_name, :last_name, :email, :isManager?, :isAdmin?])
  end
end
