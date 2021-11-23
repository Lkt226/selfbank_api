defmodule SelfbankApi.Bank do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key{:id, :binary_id, autogenerate: true}
  @fields [:uid, :account, :agency, :code, :balance, :currency]

  schema "bank_account" do
    field :uid, :string
    field :account, :integer
    field :agency, :integer, default: 1
    field :code, :integer, default: 226
    field :balance, :float, default: 0.0
    field :currency, :string, default: "BRL"

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> unique_constraint([:account])
  end
end
