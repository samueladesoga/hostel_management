defmodule HostelManagement.Router do
  use HostelManagement.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HostelManagement do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/tenants", TenantController do 
      post "/rent", TenantController, :add_rent
    end
    resources "/users", UserController, only: [:show, :new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", HostelManagement do
  #   pipe_through :api
  # end
end
