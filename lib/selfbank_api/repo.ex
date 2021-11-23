defmodule SelfbankApi.Repo do
  use Ecto.Repo,
    otp_app: :selfbank_api,
    adapter: Ecto.Adapters.Postgres
end
