defmodule PermissionWeb.PageController do
  use PermissionWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
