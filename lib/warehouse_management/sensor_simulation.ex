defmodule WarehouseManagement.SensorSimulation do
  use GenServer
  alias WarehouseManagement.Inventory

  # Inicia el GenServer
  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  # Inicializa el estado del servidor y programa el primer movimiento
  def init(_) do
    schedule_movement()
    {:ok, %{}}
  end

  # Lógica que se ejecuta cuando llega el mensaje de simular movimiento
  def handle_info(:simulate_movement, state) do
    case Inventory.random_move_product() do
      :ok ->
        IO.puts("Movimiento de producto realizado exitosamente.")
      {:error, reason} ->
        IO.puts("Error al mover producto: #{reason}")
    end

    schedule_movement()
    {:noreply, state}
  end

  # Función privada para programar el siguiente movimiento en 10 segundos
  defp schedule_movement do
    Process.send_after(self(), :simulate_movement, 10_000) # Mueve productos cada 10 segundos
  end
end
