defmodule CoolApp.PageController do
  use CoolApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
