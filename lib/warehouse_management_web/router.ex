defmodule WarehouseManagementWeb.Router do
  use WarehouseManagementWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {WarehouseManagementWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Definimos las rutas de áreas, productos y LiveView.
  scope "/", WarehouseManagementWeb do
    pipe_through :browser

    get "/", PageController, :home

    # Rutas para las áreas (AreaController)
    resources "/areas", AreaController

    # Rutas para los productos (ProductController)
    resources "/products", ProductController

    # Ruta para el LiveView de productos en tiempo real
    live "/products_live", ProductLive
  end

  # Otras rutas, como la de API (puedes descomentar si lo necesitas en el futuro).
  # scope "/api", WarehouseManagementWeb do
  #   pipe_through :api
  # end

  if Application.compile_env(:warehouse_management, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: WarehouseManagementWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
