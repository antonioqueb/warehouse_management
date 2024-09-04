defmodule WarehouseManagement.WarehouseTest do
  use WarehouseManagement.DataCase

  alias WarehouseManagement.Warehouse

  describe "areas" do
    alias WarehouseManagement.Warehouse.Area

    import WarehouseManagement.WarehouseFixtures

    @invalid_attrs %{"\\": nil}

    test "list_areas/0 returns all areas" do
      area = area_fixture()
      assert Warehouse.list_areas() == [area]
    end

    test "get_area!/1 returns the area with given id" do
      area = area_fixture()
      assert Warehouse.get_area!(area.id) == area
    end

    test "create_area/1 with valid data creates a area" do
      valid_attrs = %{"\\": "some \\"}

      assert {:ok, %Area{} = area} = Warehouse.create_area(valid_attrs)
      assert area.\ == "some \\"
    end

    test "create_area/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Warehouse.create_area(@invalid_attrs)
    end

    test "update_area/2 with valid data updates the area" do
      area = area_fixture()
      update_attrs = %{"\\": "some updated \\"}

      assert {:ok, %Area{} = area} = Warehouse.update_area(area, update_attrs)
      assert area.\ == "some updated \\"
    end

    test "update_area/2 with invalid data returns error changeset" do
      area = area_fixture()
      assert {:error, %Ecto.Changeset{}} = Warehouse.update_area(area, @invalid_attrs)
      assert area == Warehouse.get_area!(area.id)
    end

    test "delete_area/1 deletes the area" do
      area = area_fixture()
      assert {:ok, %Area{}} = Warehouse.delete_area(area)
      assert_raise Ecto.NoResultsError, fn -> Warehouse.get_area!(area.id) end
    end

    test "change_area/1 returns a area changeset" do
      area = area_fixture()
      assert %Ecto.Changeset{} = Warehouse.change_area(area)
    end
  end

  describe "areas" do
    alias WarehouseManagement.Warehouse.Area

    import WarehouseManagement.WarehouseFixtures

    @invalid_attrs %{name: nil, location: nil}

    test "list_areas/0 returns all areas" do
      area = area_fixture()
      assert Warehouse.list_areas() == [area]
    end

    test "get_area!/1 returns the area with given id" do
      area = area_fixture()
      assert Warehouse.get_area!(area.id) == area
    end

    test "create_area/1 with valid data creates a area" do
      valid_attrs = %{name: "some name", location: "some location"}

      assert {:ok, %Area{} = area} = Warehouse.create_area(valid_attrs)
      assert area.name == "some name"
      assert area.location == "some location"
    end

    test "create_area/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Warehouse.create_area(@invalid_attrs)
    end

    test "update_area/2 with valid data updates the area" do
      area = area_fixture()
      update_attrs = %{name: "some updated name", location: "some updated location"}

      assert {:ok, %Area{} = area} = Warehouse.update_area(area, update_attrs)
      assert area.name == "some updated name"
      assert area.location == "some updated location"
    end

    test "update_area/2 with invalid data returns error changeset" do
      area = area_fixture()
      assert {:error, %Ecto.Changeset{}} = Warehouse.update_area(area, @invalid_attrs)
      assert area == Warehouse.get_area!(area.id)
    end

    test "delete_area/1 deletes the area" do
      area = area_fixture()
      assert {:ok, %Area{}} = Warehouse.delete_area(area)
      assert_raise Ecto.NoResultsError, fn -> Warehouse.get_area!(area.id) end
    end

    test "change_area/1 returns a area changeset" do
      area = area_fixture()
      assert %Ecto.Changeset{} = Warehouse.change_area(area)
    end
  end
end
