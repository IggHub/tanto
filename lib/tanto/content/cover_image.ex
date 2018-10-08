defmodule Tanto.Content.CoverImage do
  use Ecto.Schema

  schema "cover_images" do
    field :file_name, :string
    belongs_to :recipe, Tanto.Content.Recipe
  end 
end
