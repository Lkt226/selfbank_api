defmodule SelfbankApi.Users.Create do
  alias SelfbankApi.{User, Repo}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
