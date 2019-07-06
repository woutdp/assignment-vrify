defmodule VRIFY.Base.CustomerAddress do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customer_addresses" do
    field :country, :string
    field :customer_id, :integer
    field :postal_code, :integer
    field :street_address, :string

    timestamps()
  end

  @doc false
  def changeset(customer_address, attrs) do
    customer_address
    |> cast(attrs, [:customer_id, :street_address, :postal_code, :country])
    |> validate_required([:customer_id, :street_address, :postal_code, :country])
  end
end
