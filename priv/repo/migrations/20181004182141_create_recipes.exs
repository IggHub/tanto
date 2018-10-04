defmodule Tanto.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :title, :string
      add :body, :text
      add :lang_code, :string
      add :slug, :string
      add :servings, :integer
      add :status, :string
      add :ingredients, :text

      timestamps()
    end
  
    create unique_index(:recipes, [:slug])
  end
end
