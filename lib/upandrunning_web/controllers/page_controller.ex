defmodule UpandrunningWeb.PageController do
  use UpandrunningWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
