defmodule SelfbankApi.Repo.Migrations.BankAccount do
  use Ecto.Migration

  def change do
    create table(:BankAccount) do
      add :account, :integer
      add :agency, :integer
      add :code, :integer
      add :balance, :float
      add :currency, :string

      timestamps()
    end

    create unique_index(:BankAccount, [:account])
  end
end
