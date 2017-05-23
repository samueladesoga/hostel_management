defmodule HostelManagement.Rent do
  use HostelManagement.Web, :model

  schema "rents" do
    field :start_date, Timex.Ecto.Date
    field :end_date, Timex.Ecto.Date
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
