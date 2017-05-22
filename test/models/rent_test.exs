defmodule HostelManagement.RentTest do
  use HostelManagement.ModelCase

  alias HostelManagement.Rent

  @valid_attrs %{end_date: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, start_date: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Rent.changeset(%Rent{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Rent.changeset(%Rent{}, @invalid_attrs)
    refute changeset.valid?
  end
end
