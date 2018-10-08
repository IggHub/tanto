defmodule Tanto.Content.RecipeTranslation do
  use Ecto.Schema

  schema "recipe_translations" do
    field :lang_code, :string
    field :status, :text
    belongs_to :recipe, Tanto.Content.Recipe
  end
end
