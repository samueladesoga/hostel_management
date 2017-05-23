defmodule HostelManagement.TenantController do
  use HostelManagement.Web, :controller

  alias HostelManagement.Tenant
  alias HostelManagement.Rent

  plug :scrub_params, "rent" when action in [:add_rent]

  def index(conn, _params) do
    tenants = Repo.all(Tenant)
    render(conn, "index.html", tenants: tenants)
  end

  def new(conn, _params) do
    changeset = Tenant.changeset(%Tenant{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tenant" => tenant_params}) do
    changeset = Tenant.changeset(%Tenant{}, tenant_params)

    case Repo.insert(changeset) do
      {:ok, _tenant} ->
        conn
        |> put_flash(:info, "Tenant created successfully.")
        |> redirect(to: tenant_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tenant = Repo.get(Tenant, id) |> Repo.preload([:rents])
    changeset = Rent.changeset(%Rent{})
    render(conn, "show.html", tenant: tenant, changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    tenant = Repo.get!(Tenant, id)
    changeset = Tenant.changeset(tenant)
    render(conn, "edit.html", tenant: tenant, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tenant" => tenant_params}) do
    tenant = Repo.get!(Tenant, id)
    changeset = Tenant.changeset(tenant, tenant_params)

    case Repo.update(changeset) do
      {:ok, tenant} ->
        conn
        |> put_flash(:info, "Tenant updated successfully.")
        |> redirect(to: tenant_path(conn, :show, tenant))
      {:error, changeset} ->
        render(conn, "edit.html", tenant: tenant, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tenant = Repo.get!(Tenant, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(tenant)

    conn
    |> put_flash(:info, "Tenant deleted successfully.")
    |> redirect(to: tenant_path(conn, :index))
  end

  def add_rent(conn, %{"rent" => rent_params, "tenant_id" => tenant_id}) do
    changeset = Rent.changeset(%Rent{}, Map.put(rent_params, "tenant_id", tenant_id))
    tenant = Tenant |> Repo.get(tenant_id) |> Repo.preload([:rents])

      IO.puts "***********"
      IO.inspect changeset
      IO.puts "***********"

      if changeset.valid? do
        Repo.insert(changeset)

        conn
        |> put_flash(:info, "Rent added.")
        |> redirect(to: tenant_path(conn, :show, tenant))
      else
        render(conn, "show.html", tenant: tenant, changeset: changeset)
      end
  end
end
