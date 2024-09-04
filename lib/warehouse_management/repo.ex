defmodule WarehouseManagement.Repo do
  use Ecto.Repo,
    otp_app: :warehouse_management,
    adapter: Ecto.Adapters.SQLite3
end
