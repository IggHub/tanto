defmodule Tanto.Repo.Migrations.ChangeIngredients do
  use Ecto.Migration

  def change do
    alter table(:recipes) do
      remove :ingredients
      add :ingredients, {:array, :map}
    end
  end
end
