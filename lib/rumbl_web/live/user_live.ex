defmodule RumblWeb.UserLive do
  use RumblWeb, :live_view
  alias Rumbl.Accounts
  # alias Rumbl.Accounts.User


  def mount(_params, _session, socket) do
    form_fields = %{"username" => "", "name" => ""}
    {:ok, assign(socket, form: to_form(form_fields))}
  end

  def handle_event("save", params, socket) do
    params
      |> Accounts.create_user()
      |> case do
        {:ok, user} -> {:noreply,
        socket
        |> put_flash(:info, "user created now")
        |> redirect(to: ~p"/users/find/#{user.id}")}

      {:error, errors} ->
        form = to_form(params, errors: errors)
        {:noreply, assign(socket, :form, form)}
    end
  end
end
