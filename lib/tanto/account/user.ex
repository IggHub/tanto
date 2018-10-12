defmodule Tanto.Account.User do
  use Ecto.Schema
  alias Tanto.Account.User
  import Ecto.Changeset

  schema "users" do
    field :username, :string 
    has_one :user_profile, Tanto.Account.UserProfile, on_delete: :delete_all
  end 

  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username])
    |> validate_exclusion(:username, ~w(tanto_admin admin superadmin))
  end
end
