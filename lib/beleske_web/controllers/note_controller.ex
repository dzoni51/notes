defmodule BeleskeWeb.NoteController do
  use BeleskeWeb, :controller

  alias Beleske.Media
  alias Beleske.Media.Note


  def index(conn, _params, current_user) do
    notes = Media.list_user_notes(current_user)
    render(conn, "index.html", notes: notes)
  end

  def new(conn, _params, current_user) do
    changeset = Media.change_note(current_user, %Note{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"note" => note_params}, current_user) do
    case Media.create_note(current_user, note_params) do
      {:ok, note} ->
        conn
        |> put_flash(:info, "Note created successfully.")
        |> redirect(to: Routes.note_path(conn, :show, note))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, current_user) do
    note = Media.get_user_note!(current_user, id)
    render(conn, "show.html", note: note)
  end

  def edit(conn, %{"id" => id}, current_user) do
    note = Media.get_user_note!(current_user, id)
    changeset = Media.change_note(current_user, note)
    render(conn, "edit.html", note: note, changeset: changeset)
  end

  def update(conn, %{"id" => id, "note" => note_params}, current_user) do
    note = Media.get_user_note!(current_user, id)

    case Media.update_note(note, note_params) do
      {:ok, note} ->
        conn
        |> put_flash(:info, "Note updated successfully.")
        |> redirect(to: Routes.note_path(conn, :show, note))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", note: note, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}, current_user) do
    note = Media.get_user_note!(current_user, id)
    {:ok, _note} = Media.delete_note(note)

    conn
    |> put_flash(:info, "Note deleted successfully.")
    |> redirect(to: Routes.note_path(conn, :index))
  end
  def action(conn, _) do
    args = [conn, conn.params, conn.assigns.current_user]
    apply(__MODULE__, action_name(conn), args)

  end

end
