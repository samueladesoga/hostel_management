defmodule HostelManagement.TenantTest do
  use HostelManagement.ModelCase

  alias HostelManagement.Tenant

  @valid_attrs %{contact_number: "some content", email: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Tenant.changeset(%Tenant{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Tenant.changeset(%Tenant{}, @invalid_attrs)
    refute changeset.valid?
  end
end
