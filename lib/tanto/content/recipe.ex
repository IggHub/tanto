defmodule Tanto.Content.Recipe do
  use Ecto.Schema

  schema "recipes" do
    field :title, :string
    field :body, :string
    field :lang_code, :string
    field :ingredients, :string
    field :servings, :integer
    field :slug, :string
    field :status, :string
    field :user_id, :integer
    has_many :recipe_translations, Tanto.Content.RecipeTranslation
    has_many :comments, Tanto.Content.Comment
    has_many :cover_images, Tanto.Content.CoverImage
  end
end

