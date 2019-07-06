defmodule VRIFYWeb.CustomerAddressView do
  use VRIFYWeb, :view
  alias VRIFYWeb.CustomerAddressView

  def render("index.json", %{customer_addresses: customer_addresses}) do
    %{data: render_many(customer_addresses, CustomerAddressView, "customer_address.json")}
  end

  def render("show.json", %{customer_address: customer_address}) do
    %{data: render_one(customer_address, CustomerAddressView, "customer_address.json")}
  end

  def render("customer_address.json", %{customer_address: customer_address}) do
    %{id: customer_address.id,
      customer_id: customer_address.customer_id,
      street_address: customer_address.street_address,
      postal_code: customer_address.postal_code,
      country: customer_address.country}
  end
end
