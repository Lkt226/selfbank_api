defmodule SelfbankApi.Banks.Get do
  alias SelfbankApi.{Bank, Repo}
  alias Ecto.UUID
  import Ecto.Query

  def call(id) do
    id
    |> UUID.cast()
    |> handle_response()
  end

  defp handle_response(:error), do: {:error, "Id invalido"}

  defp handle_response({:ok, uuid}) do

    query = from a in Bank,
    where: a.uid == ^uuid

    case Repo.all(query) do
      nil -> {:error, "Conta não encontrado"}
      account -> {:ok, account}
    end
  end
end
