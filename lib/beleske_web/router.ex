defmodule BeleskeWeb.Router do
  use BeleskeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug BeleskeWeb.Auth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end
  scope "/manage", BeleskeWeb do
    pipe_through [:browser, :authenticate_user]

    resources "/notes", NoteController
  end

  scope "/", BeleskeWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/notes", NoteController
    resources "/pictures", PictureController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BeleskeWeb do
  #   pipe_through :api
  # end
end
