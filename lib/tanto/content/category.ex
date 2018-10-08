defmodule Tanto.Content.Category do
  use Ecto.Schema

  schema "categories" do
    field :name, :string
    field :description, :text
  end
end
