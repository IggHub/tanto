defmodule Tanto.Repo.Migrations.CreateCoverImage do
  use Ecto.Migration

  def change do
    create table(:cover_image) do
      add :file_name, :string
      add :recipe_id, references(:recipes, on_delete: :delete_all)
    end

    create index(:cover_image, [:recipe_id])
  end
end
