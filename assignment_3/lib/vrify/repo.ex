defmodule VRIFY.Repo do
  use Ecto.Repo,
    otp_app: :vrify,
    adapter: Ecto.Adapters.Postgres
end
