defmodule Broadcast.AlertTest do
  use Broadcast.DataCase

  alias Broadcast.Alert

  describe "broadcasts" do
    alias Broadcast.Alert.Broadcast

    @valid_attrs %{desc: "some desc"}
    @update_attrs %{desc: "some updated desc"}
    @invalid_attrs %{desc: nil}

    def broadcast_fixture(attrs \\ %{}) do
      {:ok, broadcast} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Alert.create_broadcast()

      broadcast
    end

    test "list_broadcasts/0 returns all broadcasts" do
      broadcast = broadcast_fixture()
      assert Alert.list_broadcasts() == [broadcast]
    end

    test "get_broadcast!/1 returns the broadcast with given id" do
      broadcast = broadcast_fixture()
      assert Alert.get_broadcast!(broadcast.id) == broadcast
    end

    test "create_broadcast/1 with valid data creates a broadcast" do
      assert {:ok, %Broadcast{} = broadcast} = Alert.create_broadcast(@valid_attrs)
      assert broadcast.desc == "some desc"
    end

    test "create_broadcast/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Alert.create_broadcast(@invalid_attrs)
    end

    test "update_broadcast/2 with valid data updates the broadcast" do
      broadcast = broadcast_fixture()
      assert {:ok, broadcast} = Alert.update_broadcast(broadcast, @update_attrs)
      assert %Broadcast{} = broadcast
      assert broadcast.desc == "some updated desc"
    end

    test "update_broadcast/2 with invalid data returns error changeset" do
      broadcast = broadcast_fixture()
      assert {:error, %Ecto.Changeset{}} = Alert.update_broadcast(broadcast, @invalid_attrs)
      assert broadcast == Alert.get_broadcast!(broadcast.id)
    end

    test "delete_broadcast/1 deletes the broadcast" do
      broadcast = broadcast_fixture()
      assert {:ok, %Broadcast{}} = Alert.delete_broadcast(broadcast)
      assert_raise Ecto.NoResultsError, fn -> Alert.get_broadcast!(broadcast.id) end
    end

    test "change_broadcast/1 returns a broadcast changeset" do
      broadcast = broadcast_fixture()
      assert %Ecto.Changeset{} = Alert.change_broadcast(broadcast)
    end
  end
end
