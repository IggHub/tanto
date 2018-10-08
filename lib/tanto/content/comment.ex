defmodule Tanto.Content.Comment do
  use Ecto.Schema

  schema "comments" do
    field :body, :string
    belongs_to :recipe, Tanto.Content.Recipe
  end
end
