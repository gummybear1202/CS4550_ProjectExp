defmodule BroadcastWeb.Router do
  use BroadcastWeb, :router
  import BroadcastWeb.Plugs

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BroadcastWeb do
    pipe_through :browser # Use the default browser stack
    resources "/users", UserController
    resources "/teams", TeamController    
    resources "/broadcasts", BroadcastController

    get "/", PageController, :index

    post "/sessions", SessionController, :login
    delete "/sessions", SessionController, :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", BroadcastWeb do
  #   pipe_through :api
  # end
end
