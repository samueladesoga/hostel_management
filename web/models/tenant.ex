defmodule HostelManagement.Tenant do
  use HostelManagement.Web, :model

  schema "tenants" do
    field :name, :string
    field :email, :string
    field :contact_number, :string

    has_many :rents, HostelManagement.Rent

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :contact_number])
    |> validate_required([:name, :email, :contact_number])
  end
end
