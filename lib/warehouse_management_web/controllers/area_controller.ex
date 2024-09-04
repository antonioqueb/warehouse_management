defmodule WarehouseManagementWeb.AreaController do
  use WarehouseManagementWeb, :controller

  alias WarehouseManagement.Warehouse
  alias WarehouseManagement.Warehouse.Area

  def index(conn, _params) do
    areas = Warehouse.list_areas()
    render(conn, :index, areas: areas)
  end

  def new(conn, _params) do
    changeset = Warehouse.change_area(%Area{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"area" => area_params}) do
    case Warehouse.create_area(area_params) do
      {:ok, area} ->
        conn
        |> put_flash(:info, "Area created successfully.")
        |> redirect(to: ~p"/areas/#{area}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    area = Warehouse.get_area!(id)
    render(conn, :show, area: area)
  end

  def edit(conn, %{"id" => id}) do
    area = Warehouse.get_area!(id)
    changeset = Warehouse.change_area(area)
    render(conn, :edit, area: area, changeset: changeset)
  end

  def update(conn, %{"id" => id, "area" => area_params}) do
    area = Warehouse.get_area!(id)

    case Warehouse.update_area(area, area_params) do
      {:ok, area} ->
        conn
        |> put_flash(:info, "Area updated successfully.")
        |> redirect(to: ~p"/areas/#{area}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, area: area, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    area = Warehouse.get_area!(id)
    {:ok, _area} = Warehouse.delete_area(area)

    conn
    |> put_flash(:info, "Area deleted successfully.")
    |> redirect(to: ~p"/areas")
  end
end
