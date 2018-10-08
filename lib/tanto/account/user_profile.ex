defmodule Tanto.Account.UserProfile do
  use Ecto.Schema

  schema "user_profiles" do
    field :name, :string
    field :email, :string
  end
end
