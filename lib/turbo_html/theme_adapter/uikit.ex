defmodule Turbo.HTML.ThemeAdapter.Uikit do
  @moduledoc """
  Boostrap Theme.
  """

  defmacro pagination_links(do: expression) do
    quote do
      Phoenix.HTML.Tag.content_tag :ul, class: "uk-pagination" do
        unquote(expression)
      end
    end
  end

  defmacro page_link(url, :disabled, do: text) do
    quote do
      Phoenix.HTML.Tag.content_tag :li, class: "uk-disabled" do
        Phoenix.HTML.Link.link to: unquote(url) do
          unquote(text)
        end
      end
    end
  end

  defmacro page_link(url, :active, do: text) do
    quote do
      Phoenix.HTML.Tag.content_tag :li, class: "uk-active" do
        Phoenix.HTML.Link.link to: unquote(url) do
          [
            Phoenix.HTML.html_escape(unquote(text))
          ]
        end
      end
    end
  end

  defmacro page_link(url, do: text) do
    quote do
      Phoenix.HTML.Tag.content_tag :li do
        Phoenix.HTML.Link.link to: unquote(url) do
          Phoenix.HTML.html_escape(unquote(text))
        end
      end
    end
  end
end
