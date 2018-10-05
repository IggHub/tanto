defmodule Tanto.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :body, :string
      add :author_id, references(:users)
      add :recipe_id, references(:recipes, on_delete: :delete_all)
    end

    create index(:comments, [:author_id, :recipe_id])
  end
end
