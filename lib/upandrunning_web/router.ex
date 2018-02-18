defmodule UpandrunningWeb.Router do
  use UpandrunningWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", UpandrunningWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/plain", PageController, :plain_index
    get "/admin", PageController, :admin_index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    get "/raw/", PageController, :raw
    get "/raw/:id", PageController, :raw

    resources "/users", UserController
    resources "/posts", PostController, only: [:index, :show]
    resources "/comments", CommentController, except: [:delete]    

  end

  scope "/", UpandrunningWeb do
    get "/redirect_test", PageController, :redirect_test, as: :redirect_test
  end

  # Other scopes may use custom stacks.
  scope "/api", UpandrunningWeb do
    pipe_through :api

    get "/", PageController, :blob

    resources "/reviews", ReviewController
  end
end

# examine routes via 
# mix phx.routes