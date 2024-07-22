# When we’re designing the business logic for our accounts, we need to decide*
# * what’s public and what’s private. The Accounts module itself is the only public
# * API our controllers (or any other external components) should touch, but that
# * doesn’t mean all logic related to accounts should live there.

defmodule Rumbl.Accounts do
  @moduledoc """
  The Accounts context.
  This is the Api through which external input can make its way into our Application
  Responsible fot managing uncertainty, external interfaces
  """

  alias Rumbl.Repo
  alias Rumbl.Accounts.User

  def get_user(id) do
    Repo.get(User, id)
  end

  def get_user!(id) do
    Repo.get!(User, id)
  end

  def get_user_by(params) do
    Repo.get_by(User, params)
  end

  def list_users do
    Repo.all(User)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def change_registration(%User{} = user, params) do
    User.registration_changeset(user, params)
  end

  def register_user(attrs \\ %{}) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end
end
