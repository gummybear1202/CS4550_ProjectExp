defmodule BroadcastWeb.PageController do
  use BroadcastWeb, :controller

  def index(conn, _params) do
    redirect conn, to: broadcast_path(conn, :index)
  end
end
