defmodule VRIFY.Base do
  @moduledoc """
  The Base context.
  """

  import Ecto.Query, warn: false
  alias VRIFY.Repo

  alias VRIFY.Base.Customer

  @doc """
  Returns the list of customers.

  ## Examples

      iex> list_customers()
      [%Customer{}, ...]

  """
  def list_customers do
    Repo.all(Customer)
  end

  @doc """
  Gets a single customer.

  Raises `Ecto.NoResultsError` if the Customer does not exist.

  ## Examples

      iex> get_customer!(123)
      %Customer{}

      iex> get_customer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_customer!(id), do: Repo.get!(Customer, id)

  @doc """
  Creates a customer.

  ## Examples

      iex> create_customer(%{field: value})
      {:ok, %Customer{}}

      iex> create_customer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_customer(attrs \\ %{}) do
    %Customer{}
    |> Customer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a customer.

  ## Examples

      iex> update_customer(customer, %{field: new_value})
      {:ok, %Customer{}}

      iex> update_customer(customer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_customer(%Customer{} = customer, attrs) do
    customer
    |> Customer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Customer.

  ## Examples

      iex> delete_customer(customer)
      {:ok, %Customer{}}

      iex> delete_customer(customer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_customer(%Customer{} = customer) do
    Repo.delete(customer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking customer changes.

  ## Examples

      iex> change_customer(customer)
      %Ecto.Changeset{source: %Customer{}}

  """
  def change_customer(%Customer{} = customer) do
    Customer.changeset(customer, %{})
  end

  alias VRIFY.Base.CustomerAddress

  @doc """
  Returns the list of customer_addresses.

  ## Examples

      iex> list_customer_addresses()
      [%CustomerAddress{}, ...]

  """
  def list_customer_addresses do
    Repo.all(CustomerAddress)
  end

  @doc """
  Gets a single customer_address.

  Raises `Ecto.NoResultsError` if the Customer address does not exist.

  ## Examples

      iex> get_customer_address!(123)
      %CustomerAddress{}

      iex> get_customer_address!(456)
      ** (Ecto.NoResultsError)

  """
  def get_customer_address!(id), do: Repo.get!(CustomerAddress, id)

  @doc """
  Creates a customer_address.

  ## Examples

      iex> create_customer_address(%{field: value})
      {:ok, %CustomerAddress{}}

      iex> create_customer_address(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_customer_address(attrs \\ %{}) do
    %CustomerAddress{}
    |> CustomerAddress.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a customer_address.

  ## Examples

      iex> update_customer_address(customer_address, %{field: new_value})
      {:ok, %CustomerAddress{}}

      iex> update_customer_address(customer_address, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_customer_address(%CustomerAddress{} = customer_address, attrs) do
    customer_address
    |> CustomerAddress.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a CustomerAddress.

  ## Examples

      iex> delete_customer_address(customer_address)
      {:ok, %CustomerAddress{}}

      iex> delete_customer_address(customer_address)
      {:error, %Ecto.Changeset{}}

  """
  def delete_customer_address(%CustomerAddress{} = customer_address) do
    Repo.delete(customer_address)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking customer_address changes.

  ## Examples

      iex> change_customer_address(customer_address)
      %Ecto.Changeset{source: %CustomerAddress{}}

  """
  def change_customer_address(%CustomerAddress{} = customer_address) do
    CustomerAddress.changeset(customer_address, %{})
  end
end
