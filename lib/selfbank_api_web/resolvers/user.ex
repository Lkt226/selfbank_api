defmodule SelfbankApiWeb.Resolvers.User do
  def get(%{id: user_id}, _context), do: SelfbankApi.Users.Get.call(user_id)
  def create(%{input: params}, _context), do: SelfbankApi.Users.Create.call(params)
end
