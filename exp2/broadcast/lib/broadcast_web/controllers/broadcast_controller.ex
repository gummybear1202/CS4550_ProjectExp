defmodule BroadcastWeb.BroadcastController do
  use BroadcastWeb, :controller

  alias Broadcast.Alert
  alias Broadcast.Alert.Broadcast

  def index(conn, _params) do
    broadcasts = Alert.list_broadcasts()
    render(conn, "index.html", broadcasts: broadcasts)
  end

  def new(conn, _params) do
    changeset = Alert.change_broadcast(%Broadcast{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"broadcast" => broadcast_params}) do
    case Alert.create_broadcast(broadcast_params) do
      {:ok, broadcast} ->
        conn
        |> put_flash(:info, "Broadcast created successfully.")
        |> redirect(to: broadcast_path(conn, :show, broadcast))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    broadcast = Alert.get_broadcast!(id)
    render(conn, "show.html", broadcast: broadcast)
  end

  def edit(conn, %{"id" => id}) do
    broadcast = Alert.get_broadcast!(id)
    changeset = Alert.change_broadcast(broadcast)
    render(conn, "edit.html", broadcast: broadcast, changeset: changeset)
  end

  def update(conn, %{"id" => id, "broadcast" => broadcast_params}) do
    broadcast = Alert.get_broadcast!(id)

    case Alert.update_broadcast(broadcast, broadcast_params) do
      {:ok, broadcast} ->
        conn
        |> put_flash(:info, "Broadcast updated successfully.")
        |> redirect(to: broadcast_path(conn, :show, broadcast))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", broadcast: broadcast, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    broadcast = Alert.get_broadcast!(id)
    {:ok, _broadcast} = Alert.delete_broadcast(broadcast)

    conn
    |> put_flash(:info, "Broadcast deleted successfully.")
    |> redirect(to: broadcast_path(conn, :index))
  end
end
