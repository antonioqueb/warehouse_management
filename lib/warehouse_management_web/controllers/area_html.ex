defmodule WarehouseManagementWeb.AreaHTML do
  use WarehouseManagementWeb, :html

  embed_templates "area_html/*"

  @doc """
  Renders a area form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def area_form(assigns)
end
