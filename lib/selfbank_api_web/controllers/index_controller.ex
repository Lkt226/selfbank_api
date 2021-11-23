defmodule SelfbankApiWeb.IndexController do
  use SelfbankApiWeb, :controller

  def index(conn, _params) do
    text conn, "Hello World"
  end
end
