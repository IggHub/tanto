defmodule Tanto.Content.Recipe do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tanto.Content.{Recipe, Comment, CoverImage, Tag}

  schema "recipes" do
    field :title, :string
    field :body, :string
    field :lang_code, :string
    embeds_many :ingredients, Ingredient do
      field :name, :string
      field :quantity, :string
    end
    field :servings, :integer
    field :slug, :string
    field :status, :string
    field :user_id, :integer
    has_many :recipe_translations, Tanto.Content.RecipeTranslation
    has_many :comments, Comment, on_delete: :delete_all
    has_one :cover_image, CoverImage 
    # many_to_many :tags, Tag, join_through: "recipe_tagging"
    many_to_many :tags, Tag
  
    timestamps()
  end
 
  @doc false 
  def changeset(%Recipe{} = recipe, attrs) do
    recipe
    |> cast(attrs, [:title])
    |> validate_required([:title])
    |> cast_embed(:ingredients, with: &ingredient_changeset/2)
    |> unique_constraint(:slug)
    |> validate_change(:body, fn(:body, body) ->
      if count_word(body) < 100 do
        [body: "Can't be less than 100 words"]
      else
        []
      end
    end)
    |> cast_assoc(:cover_image, required: true)
    |> put_assoc(:tags, get_tags(attrs))
  end

  def ingredient_changeset(ingredient, attrs) do
    ingredient
    |> cast(attrs, [:name, :quantity])
    |> validate_required([:name, :quantity])
  end

  defp get_tags(attrs) do
    Tag
    |> where(name: ^attrs["tags"])
    |> Repo.all
  end

  defp count_word(body) do
    body
    |> String.split(" ")
    |> Enum.count()
  end
end

