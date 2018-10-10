defmodule Tanto.Account.UserProfile do
  use Ecto.Schema
  alias Tanto.Account.UserProfile
  alias Tanto.Content.Recipe
  import Ecto.Changeset

  schema "user_profiles" do
    field :name, :string
    field :email, :string
  end

  def changeset(%UserProfile{} = user_profile, attrs) do
    Recipe
    |> cast(attrs, [:email])
    |> validate_confirmation(:email, message: "does not match email")
  end
end
