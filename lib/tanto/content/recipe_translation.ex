defmodule Tanto.Content.RecipeTranslation do
  use Ecto.Schema

  schema "recipe_translations" do
    field :lang_code, :string
    field :status, :string
    belongs_to :recipe, Tanto.Content.Recipe, foreign_key: :original_recipe
  end
end
