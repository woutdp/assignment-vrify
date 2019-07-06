defmodule VRIFY.Repo.Migrations.CreateCustomerAddresses do
  use Ecto.Migration

  def change do
    create table(:customer_addresses) do
      add :customer_id, :integer
      add :street_address, :string
      add :postal_code, :integer
      add :country, :string

      timestamps()
    end

  end
end
