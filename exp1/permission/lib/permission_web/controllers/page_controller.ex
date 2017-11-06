defmodule PermissionWeb.PageController do
  use PermissionWeb, :controller

  def index(conn, _params) do
    conn
    |> assign(:current_user, get_session(conn, :current_user))
    |> render "index.html"
  end
end
