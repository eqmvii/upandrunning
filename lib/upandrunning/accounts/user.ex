defmodule Upandrunning.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Upandrunning.Accounts.{User, Credential}

  # Ecto's has_one macro tells Ecto how to associate User (parent) to Credential (child)
  schema "users" do
    field :name, :string
    field :username, :string
    has_one :credential, Credential

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
    |> unique_constraint(:username)
  end
end
