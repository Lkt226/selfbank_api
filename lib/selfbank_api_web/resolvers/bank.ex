defmodule SelfbankApiWeb.Resolvers.Bank do
  def get(%{uid: user_id}, _context), do: SelfbankApi.Banks.Get.call(user_id)
  def create(%{input: params}, _context), do: SelfbankApi.Banks.Create.call(params)
end
