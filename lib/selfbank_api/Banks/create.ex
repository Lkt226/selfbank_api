defmodule SelfbankApi.Banks.Create do
  alias SelfbankApi.{Bank, Repo}

  def call(params) do
    params
    |> Bank.changeset()
    |> Repo.insert()
  end
end
