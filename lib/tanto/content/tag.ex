defmodule Tanto.Content.Tag do
  use Ecto.Schema
  alias Tanto.Content.{Recipe, Tag}

  schema "tags" do
    field :name, :string 
    many_to_many :recipes, Recipe, join_through: "recipe_tagging"
  end
end
