defmodule PhoenixBootstrapWeb.PageController do
  use PhoenixBootstrapWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
