defmodule SelfbankApiWeb.Schema.Types.Bank do
  use Absinthe.Schema.Notation

  #import_types SelfbankApiWeb.Schema.Types.Custom.UUID4

  @desc "Logic for bank accounts representation"
  object :bank do
    field :id, non_null(:uuid4)
    field :uid, non_null(:string)
    field :account, non_null(:integer)
    field :agency, non_null(:integer)
    field :code, non_null(:integer)
    field :balance, non_null(:float)
    field :currency, non_null(:string)
  end

  @desc "Logic for create bank accounts"
  input_object :create_bank_input do
    field :uid, non_null(:string), description: "User ID, owner this wallet"
    field :account, non_null(:integer), description: "Bank Account for user"
  end
end
