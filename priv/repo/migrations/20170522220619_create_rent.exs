defmodule HostelManagement.Repo.Migrations.CreateRent do
  use Ecto.Migration

  def change do
    create table(:rents) do
      add :start_date, :date
      add :end_date, :date
      add :tenant_id, references(:tenants, on_delete: :nothing)

      timestamps()
    end
    create index(:rents, [:tenant_id])

  end
end
