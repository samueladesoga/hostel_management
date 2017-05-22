defmodule HostelManagement.Rent do
  use HostelManagement.Web, :model

  schema "rents" do
    field :start_date, Ecto.DateTime
    field :end_date, Ecto.DateTime
    belongs_to :tenant, HostelManagement.Tenant, foreign_key: :tenant_id

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:start_date, :end_date])
    |> validate_required([:start_date, :end_date])
  end
end
