defmodule Tanto.Content.Recipe do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tanto.Content.Recipe
  alias Tanto.Content.Comment

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
    has_many :comments, Comment
    has_many :cover_images, Tanto.Content.CoverImage
  
    timestamps()
  end
  
  def changeset(%Recipe{} = recipe, attrs) do
    recipe
    |> cast(attrs, [:title])
    |> validate_required([:title])
    |> unique_constraint(:slug)
    |> validate_change(:body, fn(:body, body) ->
      if count_word(body) < 100 do
        [body: "Can't be less than 100 words"]
      else
        []
      end
    end)
  end

  defp count_word(body) do
    body
    |> String.split(" ")
    |> Enum.count()
  end
end

