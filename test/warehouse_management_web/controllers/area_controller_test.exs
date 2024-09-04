defmodule WarehouseManagementWeb.AreaControllerTest do
  use WarehouseManagementWeb.ConnCase

  import WarehouseManagement.WarehouseFixtures

  @create_attrs %{name: "some name", location: "some location"}
  @update_attrs %{name: "some updated name", location: "some updated location"}
  @invalid_attrs %{name: nil, location: nil}

  describe "index" do
    test "lists all areas", %{conn: conn} do
      conn = get(conn, ~p"/areas")
      assert html_response(conn, 200) =~ "Listing Areas"
    end
  end

  describe "new area" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/areas/new")
      assert html_response(conn, 200) =~ "New Area"
    end
  end

  describe "create area" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/areas", area: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/areas/#{id}"

      conn = get(conn, ~p"/areas/#{id}")
      assert html_response(conn, 200) =~ "Area #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/areas", area: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Area"
    end
  end

  describe "edit area" do
    setup [:create_area]

    test "renders form for editing chosen area", %{conn: conn, area: area} do
      conn = get(conn, ~p"/areas/#{area}/edit")
      assert html_response(conn, 200) =~ "Edit Area"
    end
  end

  describe "update area" do
    setup [:create_area]

    test "redirects when data is valid", %{conn: conn, area: area} do
      conn = put(conn, ~p"/areas/#{area}", area: @update_attrs)
      assert redirected_to(conn) == ~p"/areas/#{area}"

      conn = get(conn, ~p"/areas/#{area}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, area: area} do
      conn = put(conn, ~p"/areas/#{area}", area: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Area"
    end
  end

  describe "delete area" do
    setup [:create_area]

    test "deletes chosen area", %{conn: conn, area: area} do
      conn = delete(conn, ~p"/areas/#{area}")
      assert redirected_to(conn) == ~p"/areas"

      assert_error_sent 404, fn ->
        get(conn, ~p"/areas/#{area}")
      end
    end
  end

  defp create_area(_) do
    area = area_fixture()
    %{area: area}
  end
end
