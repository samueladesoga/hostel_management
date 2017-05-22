defmodule HostelManagement.PageController do
  use HostelManagement.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
