defmodule VRIFY.BaseTest do
  use VRIFY.DataCase

  alias VRIFY.Base

  describe "customers" do
    alias VRIFY.Base.Customer

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def customer_fixture(attrs \\ %{}) do
      {:ok, customer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Base.create_customer()

      customer
    end

    test "list_customers/0 returns all customers" do
      customer = customer_fixture()
      assert Base.list_customers() == [customer]
    end

    test "get_customer!/1 returns the customer with given id" do
      customer = customer_fixture()
      assert Base.get_customer!(customer.id) == customer
    end

    test "create_customer/1 with valid data creates a customer" do
      assert {:ok, %Customer{} = customer} = Base.create_customer(@valid_attrs)
      assert customer.name == "some name"
    end

    test "create_customer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Base.create_customer(@invalid_attrs)
    end

    test "update_customer/2 with valid data updates the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{} = customer} = Base.update_customer(customer, @update_attrs)
      assert customer.name == "some updated name"
    end

    test "update_customer/2 with invalid data returns error changeset" do
      customer = customer_fixture()
      assert {:error, %Ecto.Changeset{}} = Base.update_customer(customer, @invalid_attrs)
      assert customer == Base.get_customer!(customer.id)
    end

    test "delete_customer/1 deletes the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{}} = Base.delete_customer(customer)
      assert_raise Ecto.NoResultsError, fn -> Base.get_customer!(customer.id) end
    end

    test "change_customer/1 returns a customer changeset" do
      customer = customer_fixture()
      assert %Ecto.Changeset{} = Base.change_customer(customer)
    end
  end

  describe "customer_addresses" do
    alias VRIFY.Base.CustomerAddress

    @valid_attrs %{country: "some country", customer_id: 42, postal_code: 42, street_address: "some street_address"}
    @update_attrs %{country: "some updated country", customer_id: 43, postal_code: 43, street_address: "some updated street_address"}
    @invalid_attrs %{country: nil, customer_id: nil, postal_code: nil, street_address: nil}

    def customer_address_fixture(attrs \\ %{}) do
      {:ok, customer_address} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Base.create_customer_address()

      customer_address
    end

    test "list_customer_addresses/0 returns all customer_addresses" do
      customer_address = customer_address_fixture()
      assert Base.list_customer_addresses() == [customer_address]
    end

    test "get_customer_address!/1 returns the customer_address with given id" do
      customer_address = customer_address_fixture()
      assert Base.get_customer_address!(customer_address.id) == customer_address
    end

    test "create_customer_address/1 with valid data creates a customer_address" do
      assert {:ok, %CustomerAddress{} = customer_address} = Base.create_customer_address(@valid_attrs)
      assert customer_address.country == "some country"
      assert customer_address.customer_id == 42
      assert customer_address.postal_code == 42
      assert customer_address.street_address == "some street_address"
    end

    test "create_customer_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Base.create_customer_address(@invalid_attrs)
    end

    test "update_customer_address/2 with valid data updates the customer_address" do
      customer_address = customer_address_fixture()
      assert {:ok, %CustomerAddress{} = customer_address} = Base.update_customer_address(customer_address, @update_attrs)
      assert customer_address.country == "some updated country"
      assert customer_address.customer_id == 43
      assert customer_address.postal_code == 43
      assert customer_address.street_address == "some updated street_address"
    end

    test "update_customer_address/2 with invalid data returns error changeset" do
      customer_address = customer_address_fixture()
      assert {:error, %Ecto.Changeset{}} = Base.update_customer_address(customer_address, @invalid_attrs)
      assert customer_address == Base.get_customer_address!(customer_address.id)
    end

    test "delete_customer_address/1 deletes the customer_address" do
      customer_address = customer_address_fixture()
      assert {:ok, %CustomerAddress{}} = Base.delete_customer_address(customer_address)
      assert_raise Ecto.NoResultsError, fn -> Base.get_customer_address!(customer_address.id) end
    end

    test "change_customer_address/1 returns a customer_address changeset" do
      customer_address = customer_address_fixture()
      assert %Ecto.Changeset{} = Base.change_customer_address(customer_address)
    end
  end
end
