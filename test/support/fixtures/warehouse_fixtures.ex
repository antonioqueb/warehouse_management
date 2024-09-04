defmodule WarehouseManagement.WarehouseFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WarehouseManagement.Warehouse` context.
  """

  @doc """
  Generate a area.
  """
  def area_fixture(attrs \\ %{}) do
    {:ok, area} =
      attrs
      |> Enum.into(%{
        \: "some \\"
      })
      |> WarehouseManagement.Warehouse.create_area()

    area
  end

  @doc """
  Generate a area.
  """
  def area_fixture(attrs \\ %{}) do
    {:ok, area} =
      attrs
      |> Enum.into(%{
        location: "some location",
        name: "some name"
      })
      |> WarehouseManagement.Warehouse.create_area()

    area
  end
end
