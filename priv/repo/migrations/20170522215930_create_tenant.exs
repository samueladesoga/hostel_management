defmodule HostelManagement.Repo.Migrations.CreateTenant do
  use Ecto.Migration

  def change do
    create table(:tenants) do
      add :name, :string
      add :email, :string
      add :contact_number, :string

      timestamps()
    end

  end
end
