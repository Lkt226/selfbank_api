defmodule SelfbankApiWeb.Schema do
  use Absinthe.Schema

  import_types SelfbankApiWeb.Schema.Types.Root

  query do
    import_fields :root_query
    import_fields :bank_account_query
  end

  mutation do
    import_fields :root_mutation
    import_fields :bank_account_mutation
  end
end
