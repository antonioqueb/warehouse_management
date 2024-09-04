defmodule WarehouseManagementWeb.ProductLive do
  use Phoenix.LiveView
  alias WarehouseManagement.Inventory

  def mount(_params, _session, socket) do
    if connected?(socket), do: WarehouseManagementWeb.Endpoint.subscribe("warehouse:inventory")
    {:ok, assign(socket, :products, list_products())}
  end

  def handle_info("update_inventory", _message, socket) do
    {:noreply, assign(socket, :products, list_products())}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>Inventario en Tiempo Real</h1>
      <table>
        <thead>
          <tr>
            <th>Producto</th>
            <th>Cantidad</th>
            <th>Área</th>
          </tr>
        </thead>
        <tbody>
        <%= for product <- @products do %>
          <tr>
            <td><%= product.name %></td>
            <td><%= product.quantity %></td>
            <td><%= product.area.name %></td>
          </tr>
        <% end %>
        </tbody>
      </table>
    </div>
    """
  end

  defp list_products do
    Inventory.list_products()
  end
end
