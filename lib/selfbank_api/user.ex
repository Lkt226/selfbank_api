defmodule SelfbankApi.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @fields [:email, :password, :name, :cpf]

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :cpf, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2)
    |> validate_length(:cpf, min: 11, max: 14)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email, :cpf])
  end
end