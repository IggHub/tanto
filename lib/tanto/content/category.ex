defmodule Tanto.Content.Category do
  use Ecto.Schema

  schema "categories" do
    field :name, :string
    field :description, :string
    has_many :recipes, Tanto.Content.Recipe
  end
end
