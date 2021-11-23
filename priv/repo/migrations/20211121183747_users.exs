defmodule SelfbankApi.Repo.Migrations.Users do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :name, :string
      add :password, :string
      add :cpf, :string

      timestamps()
    end

    create unique_index(:users, [:email, :cpf])
  end
end
