defmodule ShadcnUIWeb.UI.Button do
  use Phoenix.Component

  attr :variant, :string, default: "default"
  attr :as_child, :boolean, default: false
  attr :size, :string, default: "default"
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def button(assigns) do
    ~H"""
    <button
      class={[
        "inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50",
        render_button_variant(@variant),
        render_button_size(@size),
        @class
      ]}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </button>
    """
  end

  defp render_button_variant(variant_name) do
    case variant_name do
      "destructive" ->
        "bg-destructive text-destructive-foreground hover:bg-destructive/90"

      "outline" ->
        "border border-input bg-background hover:bg-accent hover:text-accent-foreground"

      "secondary" ->
        "bg-secondary text-secondary-foreground hover:bg-secondary/80"

      "ghost" ->
        "hover:bg-accent hover:text-accent-foreground"

      "link" ->
        "text-primary underline-offset-4 hover:underline"

      _ ->
        "bg-primary text-primary-foreground hover:bg-primary/90"
    end
  end

  def render_button_size(size) do
    case size do
      "sm" -> "h-9 rounded-md px-3"
      "lg" -> "h-11 rounded-md px-8"
      "icon" -> "h-10 w-10"
      _ -> "h-10 px-4 py-2"
    end
  end
end
