defmodule Tanto.Content.CoverImage do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tanto.Content.{CoverImage, Recipe}

  schema "cover_images" do
    field :file_name, :string
    belongs_to :recipe, Recipe
  
    timestamps()
  end 

  @doc false
  def changeset(%CoverImage{} = cover_image, attrs) do
    cover_image
    |> cast(attrs, [:file_name])
    |> validate_required([:file_name])
  end
end
