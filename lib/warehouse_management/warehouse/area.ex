defmodule WarehouseManagement.Warehouse.Area do
  use Ecto.Schema
  import Ecto.Changeset

  schema "areas" do
    field :name, :string
    field :location, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(area, attrs) do
    area
    |> cast(attrs, [:name, :location])
    |> validate_required([:name, :location])
  end
end
