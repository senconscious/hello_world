defmodule HelloWorldWeb.RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias HelloWorldWeb.Router

  @opts Router.init([])

  test "returns hello world" do
    # Create a test connection
    conn = conn(:get, "/")

    # Invoke the plug
    conn = Router.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Hello world!"
  end

  test "return 404" do
    conn = conn(:get, "/not_existing_resource")

    conn = Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 404
    assert conn.resp_body == "Not found"
  end
end
