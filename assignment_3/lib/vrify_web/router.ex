defmodule VRIFYWeb.Router do
  use VRIFYWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", VRIFYWeb do
    pipe_through :api
    resources "/customers", CustomerController, except: [:new, :edit]
    resources "/customer_addresses", CustomerAddressController, except: [:new, :edit]
  end
end
