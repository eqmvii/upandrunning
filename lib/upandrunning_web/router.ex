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
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show

    resources "/users", UserController
    resources "/posts", PostController, only: [:index, :show]
    resources "/comments", CommentController, except: [:delete]
    

  end

  # Other scopes may use custom stacks.
  scope "/api", UpandrunningWeb do
    pipe_through :api

    resources "/reviews", ReviewController
  end
end

# examine routes via 
# mix phx.routes