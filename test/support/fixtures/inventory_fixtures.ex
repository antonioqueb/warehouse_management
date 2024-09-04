defmodule WarehouseManagement.InventoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `WarehouseManagement.Inventory` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        name: "some name",
        quantity: 42
      })
      |> WarehouseManagement.Inventory.create_product()

    product
  end
end
