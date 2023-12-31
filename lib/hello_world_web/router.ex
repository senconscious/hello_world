defmodule HelloWorldWeb.Router do
  @moduledoc """
    Application's router for handling requests
  """

  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Hello world!")
  end

  match _ do
    send_resp(conn, 404, "Not found")
  end
end
