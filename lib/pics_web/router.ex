defmodule PicsWeb.Router do
  use PicsWeb, :router

  pipeline :browser do
    plug :accepts, ["html", "json"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
    plug PicsWeb.Plugs.AssignUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PicsWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/images", ImageController, :index
    get "/images/new", ImageController, :new
    post "/images", ImageController, :create
  end

  scope "/auth", PicsWeb do
    pipe_through :browser

    get "/logout", UserController, :logout
    get "/:provider", UserController, :request
    get "/:provider/callback", UserController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", PicsWeb do
  #   pipe_through :api
  # end
end
