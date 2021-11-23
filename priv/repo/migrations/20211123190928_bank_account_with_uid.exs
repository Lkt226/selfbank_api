defmodule SelfbankApi.Repo.Migrations.BankAccountWithUid do
  use Ecto.Migration

  def change do
      create table(:bank_account) do
        add :uid, :string
        add :account, :integer
        add :agency, :integer
        add :code, :integer
        add :balance, :float
        add :currency, :string

        timestamps()
      end

      create unique_index(:bank_account, [:account])
  end
end
