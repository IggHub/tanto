defmodule Tanto.Repo.Migrations.CreateUserProfiles do
  use Ecto.Migration

  def change do
    create table(:user_profiles) do
      add :name, :string
      add :email, :string
      add :user_id, references(:users, on_delete: :delete_all)
    end

    create index(:user_profiles, [:user_id])
  end
end
