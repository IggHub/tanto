defmodule Tanto.Repo.Migrations.AddCategoryIdToRecipes do
  use Ecto.Migration

  def change do
    alter table(:recipes) do
      add :category_id, references(:categories, on_delete: :nothing)
    end
  
    create index(:recipes, [:category_id])
  end
end
