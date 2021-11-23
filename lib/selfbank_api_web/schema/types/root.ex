defmodule SelfbankApiWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  import_types SelfbankApiWeb.Schema.Types.Custom.UUID4

  alias SelfbankApiWeb.Resolvers.User, as: UserResolver
  alias SelfbankApiWeb.Resolvers.Bank, as: BankResolver

  import_types SelfbankApiWeb.Schema.Types.User
  import_types SelfbankApiWeb.Schema.Types.Bank

  object :root_query do
    field :get_user, :user do
      arg :id, non_null(:uuid4)

      resolve &UserResolver.get/2
    end
  end

  object :bank_account_query do
    field :get_bank_account, :bank do
      arg :uid, non_null(:string)
       resolve &BankResolver.get/2
     end
  end

  object :root_mutation do
    field :create_user, :user do
      arg :input, non_null(:create_user_input)

      resolve &UserResolver.create/2
    end
  end

  object :bank_account_mutation do
    field :create_bank_account, :bank do
      arg :input, non_null(:create_bank_input)

      resolve &BankResolver.create/2
    end
  end
end
