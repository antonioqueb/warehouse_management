import Config

# Configuración de la base de datos (SQLite)
config :warehouse_management, WarehouseManagement.Repo,
  database: Path.expand("../warehouse_management_dev.db", __DIR__),
  pool_size: 5,
  stacktrace: true,
  show_sensitive_data_on_connection_error: true

# Configuración del endpoint en desarrollo
config :warehouse_management, WarehouseManagementWeb.Endpoint,
  # Configuración del servidor HTTP (localhost por defecto)
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "FmqwcoXs67WE5LA0SjYT6gCkpdE756bqlNUQ1VPtSlUlNGgW+iKIPOURKim9bLd8",
  watchers: [
    # Watcher para esbuild (compilación JS y CSS)
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]},
    # Watcher para Tailwind (compilación CSS)
    tailwind: {Tailwind, :install_and_run, [:default, ~w(--watch)]}
  ]

# Live reload para recargar automáticamente el navegador
config :warehouse_management, WarehouseManagementWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/warehouse_management_web/(controllers|live|components)/.*(ex|heex)$"
    ]
  ]

# Activar rutas de desarrollo como el dashboard de Phoenix y el mailbox
config :warehouse_management, dev_routes: true

# Configuración de logging: sin metadata ni timestamps en los logs de desarrollo
config :logger, :console, format: "[$level] $message\n"

# Aumentar el límite de profundidad del stacktrace en desarrollo (no recomendado en producción)
config :phoenix, :stacktrace_depth, 20

# Inicializar plugs en tiempo de ejecución para acelerar la compilación en desarrollo
config :phoenix, :plug_init_mode, :runtime

# Configuración de Phoenix LiveView para el desarrollo
config :phoenix_live_view,
  # Incluir anotaciones de depuración en el HTML generado
  debug_heex_annotations: true,
  # Habilitar comprobaciones costosas en tiempo de ejecución
  enable_expensive_runtime_checks: true

# Deshabilitar el cliente de la API de Swoosh, ya que solo es necesario para producción
config :swoosh, :api_client, false
