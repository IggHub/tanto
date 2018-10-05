defmodule Tanto.Repo.Migrations.CreateRecipeTranslations do
  use Ecto.Migration

  def change do
    create table(:recipe_translations) do
      add :lang_code, :string
      add :status, :text
      add :original_recipe_id, references(:recipes)
      add :translated_recipe_id, references(:recipes, on_delete: :nilify_all) 
    end 

    create index(:recipe_translations, [:original_recipe_id, :translated_recipe_id])
  end
end
