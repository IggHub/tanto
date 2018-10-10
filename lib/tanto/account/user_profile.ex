defmodule Tanto.Account.UserProfile do
  use Ecto.Schema
  alias Tanto.Account.UserProfile
  schema "user_profiles" do
    field :name, :string
    field :email, :string
    
    timestamp
  end

  def changeset(%UserProfile{} = user_profile, attrs) do
    recipe
    |> cast(data, params[:email])
    |> validate_confirmation(:email, message: "does not match email")
  end
end
