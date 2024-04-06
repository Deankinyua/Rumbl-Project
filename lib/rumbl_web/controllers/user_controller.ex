defmodule RumblWeb.UserController do
  use RumblWeb, :controller

  alias Rumbl.Accounts
  plug :authenticate when action in [:index, :show]
  # alias Rumbl.Accounts.User
  # use RumblWeb, :live_view

  def index(conn, _params) do
    users = Accounts.list_users()
    # IO.inspect(conn.private.phoenix_action)
    render(conn, :index, users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user(id)
    render(conn, :show, user: user)
  end

  defp authenticate(conn, _options) do
    # conn.private.phoenix_action
      if conn.assigns.current_user do
        conn
      else
        conn
        |> put_flash(:error, "You must be logged in to access that page")
        |> redirect(to: ~p"/")
        |> halt()
      end

    # IO.inspect(options)
  end

  # defp authenticate_if_required(conn, _) do
  #   if Enum.member?([:index, :show], conn.params["_action"]) do
  #     conn
  #     |>  Plug.authenticate.call()
  #   else
  #     conn
  #   end
  # end

  # def new(conn, _params) do
  #   changeset = Accounts.change_registration(%User{}, %{})
  #   render(conn, :new, changeset: changeset)
  # end
end
