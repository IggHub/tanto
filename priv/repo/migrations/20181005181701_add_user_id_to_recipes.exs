defmodule Tanto.Repo.Migrations.AddUserIdToRecipes do
  use Ecto.Migration

  def change do
    alter table(:recipes) do
      add :user_id, references(:users, on_delete: :delete_all)
    end

    create index(:recipes, [:user_id])
  end
end
