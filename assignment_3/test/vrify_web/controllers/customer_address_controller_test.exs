defmodule VRIFYWeb.CustomerAddressControllerTest do
  use VRIFYWeb.ConnCase

  alias VRIFY.Base
  alias VRIFY.Base.CustomerAddress

  @create_attrs %{
    country: "some country",
    customer_id: 42,
    postal_code: 42,
    street_address: "some street_address"
  }
  @update_attrs %{
    country: "some updated country",
    customer_id: 43,
    postal_code: 43,
    street_address: "some updated street_address"
  }
  @invalid_attrs %{country: nil, customer_id: nil, postal_code: nil, street_address: nil}

  def fixture(:customer_address) do
    {:ok, customer_address} = Base.create_customer_address(@create_attrs)
    customer_address
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all customer_addresses", %{conn: conn} do
      conn = get(conn, Routes.customer_address_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create customer_address" do
    test "renders customer_address when data is valid", %{conn: conn} do
      conn = post(conn, Routes.customer_address_path(conn, :create), customer_address: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.customer_address_path(conn, :show, id))

      assert %{
               "id" => id,
               "country" => "some country",
               "customer_id" => 42,
               "postal_code" => 42,
               "street_address" => "some street_address"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.customer_address_path(conn, :create), customer_address: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update customer_address" do
    setup [:create_customer_address]

    test "renders customer_address when data is valid", %{conn: conn, customer_address: %CustomerAddress{id: id} = customer_address} do
      conn = put(conn, Routes.customer_address_path(conn, :update, customer_address), customer_address: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.customer_address_path(conn, :show, id))

      assert %{
               "id" => id,
               "country" => "some updated country",
               "customer_id" => 43,
               "postal_code" => 43,
               "street_address" => "some updated street_address"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, customer_address: customer_address} do
      conn = put(conn, Routes.customer_address_path(conn, :update, customer_address), customer_address: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete customer_address" do
    setup [:create_customer_address]

    test "deletes chosen customer_address", %{conn: conn, customer_address: customer_address} do
      conn = delete(conn, Routes.customer_address_path(conn, :delete, customer_address))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.customer_address_path(conn, :show, customer_address))
      end
    end
  end

  defp create_customer_address(_) do
    customer_address = fixture(:customer_address)
    {:ok, customer_address: customer_address}
  end
end
