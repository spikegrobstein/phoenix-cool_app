defmodule CoolApp.AlbumArt do
  use CoolApp.Web, :model

  embedded_schema do
    field :width, :integer
    field :height, :integer
    field :url, :string
  end
end
