defmodule UpandrunningWeb.PageController do
  use UpandrunningWeb, :controller

  def index(conn, _params) do
    # render conn, "index.html"
    conn
    |> put_flash(:info, "Hello this is a flash message!")
    |> put_flash(:error, "This is a fake error message.")
    |> render("index.html")
  end

  # def index(conn, _params) do
  #   redirect conn, external: "http://www.github.com"
  # end

  # def redirect_test(conn, _params) do
  #   text conn, "Redirect!"
  # end

  def admin_index(conn, _params) do
    # render the page with no logo
    conn
    |> put_layout("admin.html")
    |> put_flash(:info, "Welcome to the logo-free admin page!")
    |> render("index.html")
  end

  def plain_index(conn, _params) do
    conn
    |> put_layout(false)
    |> put_flash(:info, "Hello this is a flash message!")
    |> put_flash(:error, "This is a fake error message.")
    |> render("index.html")    
  end

  def test(conn, _params) do
    conn
    |> render("test.html")
  end

  def blob(conn, _params) do
    json conn, %{name: "Eric"}
  end

  def raw(conn, %{"id" => id}) do
    html conn, """
    <html><head><title>Raw HTML</title></head>
    <body>
        <h2>Hello! You sent in #{id}.</h2>
    </body>
    </html>    
    """
  end

  def raw(conn, _params) do
    html conn, """
    <html><head><title>Raw HTML</title></head>
    <body>
        <h2>Hello! You did not send an ID.</h2>
    </body>
    </html>    
    """
  end

end
