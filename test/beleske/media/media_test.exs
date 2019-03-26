defmodule Beleske.MediaTest do
  use Beleske.DataCase

  alias Beleske.Media

  describe "notes" do
    alias Beleske.Media.Note

    @valid_attrs %{" title": "some  title", note: "some note"}
    @update_attrs %{" title": "some updated  title", note: "some updated note"}
    @invalid_attrs %{" title": nil, note: nil}

    def note_fixture(attrs \\ %{}) do
      {:ok, note} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Media.create_note()

      note
    end

    test "list_notes/0 returns all notes" do
      note = note_fixture()
      assert Media.list_notes() == [note]
    end

    test "get_note!/1 returns the note with given id" do
      note = note_fixture()
      assert Media.get_note!(note.id) == note
    end

    test "create_note/1 with valid data creates a note" do
      assert {:ok, %Note{} = note} = Media.create_note(@valid_attrs)
      assert note. title == "some  title"
      assert note.note == "some note"
    end

    test "create_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Media.create_note(@invalid_attrs)
    end

    test "update_note/2 with valid data updates the note" do
      note = note_fixture()
      assert {:ok, %Note{} = note} = Media.update_note(note, @update_attrs)
      assert note. title == "some updated  title"
      assert note.note == "some updated note"
    end

    test "update_note/2 with invalid data returns error changeset" do
      note = note_fixture()
      assert {:error, %Ecto.Changeset{}} = Media.update_note(note, @invalid_attrs)
      assert note == Media.get_note!(note.id)
    end

    test "delete_note/1 deletes the note" do
      note = note_fixture()
      assert {:ok, %Note{}} = Media.delete_note(note)
      assert_raise Ecto.NoResultsError, fn -> Media.get_note!(note.id) end
    end

    test "change_note/1 returns a note changeset" do
      note = note_fixture()
      assert %Ecto.Changeset{} = Media.change_note(note)
    end
  end

  describe "notes" do
    alias Beleske.Media.Note

    @valid_attrs %{note: "some note", title: "some title"}
    @update_attrs %{note: "some updated note", title: "some updated title"}
    @invalid_attrs %{note: nil, title: nil}

    def note_fixture(attrs \\ %{}) do
      {:ok, note} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Media.create_note()

      note
    end

    test "list_notes/0 returns all notes" do
      note = note_fixture()
      assert Media.list_notes() == [note]
    end

    test "get_note!/1 returns the note with given id" do
      note = note_fixture()
      assert Media.get_note!(note.id) == note
    end

    test "create_note/1 with valid data creates a note" do
      assert {:ok, %Note{} = note} = Media.create_note(@valid_attrs)
      assert note.note == "some note"
      assert note.title == "some title"
    end

    test "create_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Media.create_note(@invalid_attrs)
    end

    test "update_note/2 with valid data updates the note" do
      note = note_fixture()
      assert {:ok, %Note{} = note} = Media.update_note(note, @update_attrs)
      assert note.note == "some updated note"
      assert note.title == "some updated title"
    end

    test "update_note/2 with invalid data returns error changeset" do
      note = note_fixture()
      assert {:error, %Ecto.Changeset{}} = Media.update_note(note, @invalid_attrs)
      assert note == Media.get_note!(note.id)
    end

    test "delete_note/1 deletes the note" do
      note = note_fixture()
      assert {:ok, %Note{}} = Media.delete_note(note)
      assert_raise Ecto.NoResultsError, fn -> Media.get_note!(note.id) end
    end

    test "change_note/1 returns a note changeset" do
      note = note_fixture()
      assert %Ecto.Changeset{} = Media.change_note(note)
    end
  end
end
