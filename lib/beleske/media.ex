defmodule Beleske.Media do
  @moduledoc """
  The Media context.
  """

  import Ecto.Query, warn: false
  alias Beleske.Repo

  alias Beleske.Media.Note
  alias Beleske.Accounts

  @doc """
  Returns the list of notes.

  ## Examples

      iex> list_notes()
      [%Note{}, ...]

  """
  def list_notes do
    Note
    |> Repo.all(Note)
    |> preload_user()
  end

  @doc """
  Gets a single note.

  Raises `Ecto.NoResultsError` if the Note does not exist.

  ## Examples

      iex> get_note!(123)
      %Note{}

      iex> get_note!(456)
      ** (Ecto.NoResultsError)

  """
  def get_note!(id), do: preload_user(Repo.get!(Note, id))

  @doc """
  Creates a note.

  ## Examples

      iex> create_note(%{field: value})
      {:ok, %Note{}}

      iex> create_note(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_note(%Accounts.User{} = user, attrs \\ %{}) do
    %Note{}
    |> Note.changeset(attrs)
    |> put_user(user)
    |> Repo.insert()
  end

  @doc """
  Updates a note.

  ## Examples

      iex> update_note(note, %{field: new_value})
      {:ok, %Note{}}

      iex> update_note(note, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_note(%Note{} = note, attrs) do
    note
    |> Note.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Note.

  ## Examples

      iex> delete_note(note)
      {:ok, %Note{}}

      iex> delete_note(note)
      {:error, %Ecto.Changeset{}}

  """
  def delete_note(%Note{} = note) do
    Repo.delete(note)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking note changes.

  ## Examples

      iex> change_note(note)
      %Ecto.Changeset{source: %Note{}}

  """
  def change_note(%Accounts.User{} = user, %Note{} = note) do
    note
    |> Note.changeset(%{})
    |> put_user(user)
  end
  defp put_user(changeset, user) do
    Ecto.Changeset.put_assoc(changeset, :user, user)

  end
  def list_user_notes(%Accounts.User{} = user) do
    Note
    |> user_notes_query(user)
    |> Repo.all()
    |> preload_user()

  end
  def get_user_note!(%Accounts.User{} = user, id) do
    from(n in Note, where: n.id == ^id)
    |> user_notes_query(user)
    |> Repo.one!()
    |> preload_user()
  end
  defp user_notes_query(query, %Accounts.User{id: user_id}) do
    from(n in query, where: n.user_id == ^user_id)

  end
  defp preload_user(note_or_notes) do
    Repo.preload(note_or_notes, :user)

  end

end
