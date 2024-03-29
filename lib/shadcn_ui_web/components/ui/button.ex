defmodule ShadcnUIWeb.UI.Button do
  use Phoenix.Component

  attr :variant, :string,
    default: "default",
    values: ~W(default destructive outline secondary ghost link)

  attr :size, :string,
    default: "default",
    values: ~W(default sm lg icon)

  attr :as, :string, default: "button", examples: ~W(a button)
  attr :class, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def button(assigns) do
    ~H"""
    <.dynamic_tag
      name={@as}
      class={[
        "inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50",
        render_button_variant(@variant),
        render_button_size(@size),
        @class
      ]}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </.dynamic_tag>
    """
  end

  defp render_button_variant("default"),
    do: "bg-primary text-primary-foreground hover:bg-primary/90"

  defp render_button_variant("destructive"),
    do: "bg-destructive text-destructive-foreground hover:bg-destructive/90"

  defp render_button_variant("outline"),
    do: "border border-input bg-background hover:bg-accent hover:text-accent-foreground"

  defp render_button_variant("secondary"),
    do: "bg-secondary text-secondary-foreground hover:bg-secondary/80"

  defp render_button_variant("ghost"), do: "hover:bg-accent hover:text-accent-foreground"
  defp render_button_variant("link"), do: "text-primary underline-offset-4 hover:underline"

  defp render_button_variant(_), do: render_button_variant("default")

  defp render_button_size("sm"), do: "h-9 rounded-md px-3"
  defp render_button_size("lg"), do: "h-11 rounded-md px-8"
  defp render_button_size("icon"), do: "h-10 w-10"
  defp render_button_size(_), do: "h-10 px-4 py-2"
end
