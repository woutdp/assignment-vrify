defmodule VRIFYWeb.CustomerAddressController do
  use VRIFYWeb, :controller

  alias VRIFY.Base
  alias VRIFY.Base.CustomerAddress

  action_fallback VRIFYWeb.FallbackController

  def index(conn, _params) do
    customer_addresses = Base.list_customer_addresses()
    render(conn, "index.json", customer_addresses: customer_addresses)
  end

  def create(conn, %{"customer_address" => customer_address_params}) do
    with {:ok, %CustomerAddress{} = customer_address} <- Base.create_customer_address(customer_address_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.customer_address_path(conn, :show, customer_address))
      |> render("show.json", customer_address: customer_address)
    end
  end

  def show(conn, %{"id" => id}) do
    customer_address = Base.get_customer_address!(id)
    render(conn, "show.json", customer_address: customer_address)
  end

  def update(conn, %{"id" => id, "customer_address" => customer_address_params}) do
    customer_address = Base.get_customer_address!(id)

    with {:ok, %CustomerAddress{} = customer_address} <- Base.update_customer_address(customer_address, customer_address_params) do
      render(conn, "show.json", customer_address: customer_address)
    end
  end

  def delete(conn, %{"id" => id}) do
    customer_address = Base.get_customer_address!(id)

    with {:ok, %CustomerAddress{}} <- Base.delete_customer_address(customer_address) do
      send_resp(conn, :no_content, "")
    end
  end
end
