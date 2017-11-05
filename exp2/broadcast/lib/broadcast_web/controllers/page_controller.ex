defmodule BroadcastWeb.PageController do
  use BroadcastWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
