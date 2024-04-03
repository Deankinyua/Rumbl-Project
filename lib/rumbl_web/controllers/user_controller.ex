defmodule RumblWeb.UserController do
  use RumblWeb, :controller

  alias Rumbl.Accounts
  # alias Rumbl.Accounts.User
  # use RumblWeb, :live_view

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, :index, users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user(id)
    render(conn, :show, user: user)
  end

  # def new(conn, _params) do
  #   changeset = Accounts.change_registration(%User{}, %{})
  #   render(conn, :new, changeset: changeset)
  # end
end
