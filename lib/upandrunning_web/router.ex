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
    get "/test", PageController, :test
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    get "/raw/", PageController, :raw
    get "/raw/:id", PageController, :raw

    resources "/users", UserController
    # resources "/posts", PostController, only: [:index, :show]
    # resources "/comments", CommentController, except: [:delete]
    resources "/sessions", SessionController, only: [:new, :create, :delete], singleton: true 

  end

  # scope "/", UpandrunningWeb do
  #   get "/redirect_test", PageController, :redirect_test, as: :redirect_test
  # end

  # Other scopes may use custom stacks.
  scope "/api", UpandrunningWeb do
    pipe_through :api

    get "/", PageController, :blob

    resources "/reviews", ReviewController
  end

  # use Plugg.Conn.get_session to look for the user in the session
  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login required")
        |> Phoenix.Controller.redirect(to: "/")
        |> halt()
      user_id ->
        assign(conn, :current_user, Upandrunning.Accounts.get_user!(user_id))
    end
  end

end

# examine routes via 
# mix phx.routes