defmodule UpandrunningWeb.LayoutView do
  use UpandrunningWeb, :view

  # this is actually just a local call from the parallel render template function
  # .eex templates are just functions being rendered
  def title do
    "View Function Title Works!"
  end

end
