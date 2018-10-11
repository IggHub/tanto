defmodule Tanto.Content.Comment do
  use Ecto.Schema
  import Ecto.Changeset  
  alias Tanto.Content.Recipe
  
  schema "comments" do
    field :body, :string
    belongs_to :recipe, Recipe
  end

  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:body])
    |> validate_required([:body, :recipe_id])
    |> assoc_constraint(:recipe)
  end
end
