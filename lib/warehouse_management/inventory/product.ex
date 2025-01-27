defmodule WarehouseManagement.Inventory.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :quantity, :integer
    field :area_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :quantity])
    |> validate_required([:name, :quantity])
  end
end
