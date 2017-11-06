defmodule BroadcastWeb.BroadcastControllerTest do
  use BroadcastWeb.ConnCase

  alias Broadcast.Alert

  @create_attrs %{desc: "some desc"}
  @update_attrs %{desc: "some updated desc"}
  @invalid_attrs %{desc: nil}

  def fixture(:broadcast) do
    {:ok, broadcast} = Alert.create_broadcast(@create_attrs)
    broadcast
  end

  describe "index" do
    test "lists all broadcasts", %{conn: conn} do
      conn = get conn, broadcast_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Broadcasts"
    end
  end

  describe "new broadcast" do
    test "renders form", %{conn: conn} do
      conn = get conn, broadcast_path(conn, :new)
      assert html_response(conn, 200) =~ "New Broadcast"
    end
  end

  describe "create broadcast" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, broadcast_path(conn, :create), broadcast: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == broadcast_path(conn, :show, id)

      conn = get conn, broadcast_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Broadcast"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, broadcast_path(conn, :create), broadcast: @invalid_attrs
      assert html_response(conn, 200) =~ "New Broadcast"
    end
  end

  describe "edit broadcast" do
    setup [:create_broadcast]

    test "renders form for editing chosen broadcast", %{conn: conn, broadcast: broadcast} do
      conn = get conn, broadcast_path(conn, :edit, broadcast)
      assert html_response(conn, 200) =~ "Edit Broadcast"
    end
  end

  describe "update broadcast" do
    setup [:create_broadcast]

    test "redirects when data is valid", %{conn: conn, broadcast: broadcast} do
      conn = put conn, broadcast_path(conn, :update, broadcast), broadcast: @update_attrs
      assert redirected_to(conn) == broadcast_path(conn, :show, broadcast)

      conn = get conn, broadcast_path(conn, :show, broadcast)
      assert html_response(conn, 200) =~ "some updated desc"
    end

    test "renders errors when data is invalid", %{conn: conn, broadcast: broadcast} do
      conn = put conn, broadcast_path(conn, :update, broadcast), broadcast: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Broadcast"
    end
  end

  describe "delete broadcast" do
    setup [:create_broadcast]

    test "deletes chosen broadcast", %{conn: conn, broadcast: broadcast} do
      conn = delete conn, broadcast_path(conn, :delete, broadcast)
      assert redirected_to(conn) == broadcast_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, broadcast_path(conn, :show, broadcast)
      end
    end
  end

  defp create_broadcast(_) do
    broadcast = fixture(:broadcast)
    {:ok, broadcast: broadcast}
  end
end
