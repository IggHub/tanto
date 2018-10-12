defmodule Tanto.Repo.Migrations.CreateRecipeTagging do
  use Ecto.Migration

  def change do
    create table(:recipe_tagging, primary_key: false) do
      add :recipe_id, references(:recipes, on_delete: :delete_all)
      add :tag_id, references(:tags, on_delete: :delete_all)
    end
  end
end
